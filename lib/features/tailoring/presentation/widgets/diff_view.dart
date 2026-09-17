import 'dart:convert';

import 'package:flutter/material.dart';

import '../../domain/models/bullet_diff.dart';
import '../../domain/models/tailoring_result.dart';

/// The `skills` bulletId's `original`/`suggested` come back as a
/// JSON-encoded array serialized into the string field (e.g.
/// `'["Dart","Flutter"]'`) rather than prose — both are still just `string`
/// per the contract, so this is a display nicety with a safe fallback, not
/// a contract assumption.
String _displayText(String raw) {
  try {
    final decoded = jsonDecode(raw);
    if (decoded is List) return decoded.join(', ');
  } catch (_) {
    // Not JSON — display as-is.
  }
  return raw;
}

/// Renders every actionable [BulletDiff] in [result], grouped by section,
/// with a per-bullet accept/reject toggle for bullets the guardrail actually
/// let through (`modified`). `unchanged` bullets carry nothing to review and
/// are omitted; `flagged_invented` bullets are shown but not toggleable —
/// the server ignores them even if requested, so offering a toggle would lie
/// about what "accepting" one does.
class DiffView extends StatelessWidget {
  const DiffView({
    super.key,
    required this.result,
    required this.selectedBulletIds,
    required this.onToggle,
    this.enabled = true,
  });

  final TailoringResult result;
  final Set<String> selectedBulletIds;
  final ValueChanged<String> onToggle;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final groups = _groupSections(result);

    if (groups.isEmpty) {
      return const Center(child: Text('No suggested changes to review.'));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (final group in groups)
          _DiffSection(
            title: group.title,
            diffs: group.diffs,
            selectedBulletIds: selectedBulletIds,
            onToggle: enabled ? onToggle : null,
          ),
      ],
    );
  }

  List<_SectionGroup> _groupSections(TailoringResult result) {
    final reviewable = result.perBulletDiffs
        .where((d) => d.status != BulletDiffStatus.unchanged)
        .toList();

    final bySectionId = <String, List<BulletDiff>>{};
    for (final diff in reviewable) {
      bySectionId.putIfAbsent(diff.sectionId, () => []).add(diff);
    }

    return bySectionId.entries
        .map((e) => _SectionGroup(title: _titleFor(e.key), diffs: e.value))
        .toList();
  }

  String _titleFor(String sectionId) {
    if (sectionId == 'summary') return 'Summary';
    if (sectionId == 'skills') return 'Skills';

    final match = RegExp(r'^experience-(\d+)$').firstMatch(sectionId);
    if (match != null) {
      final index = int.parse(match.group(1)!);
      final entries = result.originalSections.experience;
      final entry = (entries != null && index < entries.length) ? entries[index] : null;
      if (entry?.title != null && entry?.company != null) {
        return '${entry!.title} at ${entry.company}';
      }
      return entry?.title ?? entry?.company ?? 'Experience ${index + 1}';
    }

    return sectionId;
  }
}

class _SectionGroup {
  const _SectionGroup({required this.title, required this.diffs});

  final String title;
  final List<BulletDiff> diffs;
}

class _DiffSection extends StatelessWidget {
  const _DiffSection({
    required this.title,
    required this.diffs,
    required this.selectedBulletIds,
    required this.onToggle,
  });

  final String title;
  final List<BulletDiff> diffs;
  final Set<String> selectedBulletIds;
  final ValueChanged<String>? onToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text(title, style: Theme.of(context).textTheme.titleMedium),
            ),
            for (final diff in diffs)
              diff.status == BulletDiffStatus.flaggedInvented
                  ? _FlaggedRow(diff: diff)
                  : _ModifiedRow(
                      diff: diff,
                      isSelected: selectedBulletIds.contains(diff.bulletId),
                      onToggle: onToggle == null ? null : () => onToggle!(diff.bulletId),
                    ),
          ],
        ),
      ),
    );
  }
}

class _ModifiedRow extends StatelessWidget {
  const _ModifiedRow({required this.diff, required this.isSelected, required this.onToggle});

  final BulletDiff diff;
  final bool isSelected;
  final VoidCallback? onToggle;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onToggle,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(value: isSelected, onChanged: onToggle == null ? null : (_) => onToggle!()),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _displayText(diff.original),
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _displayText(diff.suggested),
                    style: TextStyle(
                      color: isSelected ? scheme.primary : scheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FlaggedRow extends StatelessWidget {
  const _FlaggedRow({required this.diff});

  final BulletDiff diff;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.flag_outlined, size: 20, color: scheme.error),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Blocked — could not be verified against your original resume',
                  style: TextStyle(color: scheme.error, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Text(
                  _displayText(diff.suggested),
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text('Kept: ${_displayText(diff.original)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
