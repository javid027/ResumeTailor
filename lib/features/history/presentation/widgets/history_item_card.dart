import 'package:flutter/material.dart';

import '../../../tailoring/domain/models/tailoring_result.dart';
import '../../../tailoring/presentation/widgets/ats_score_badge.dart';
import '../../domain/models/history_item.dart';

class HistoryItemCard extends StatelessWidget {
  const HistoryItemCard({super.key, required this.item, required this.onTap});

  final HistoryItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.resume.name ?? 'Untitled resume',
                style: textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                item.jobDescription.excerpt,
                style: textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _StatusChip(status: item.status),
                  AtsScoreBadge(before: item.atsScoreBefore, after: item.atsScoreAfter),
                  if (item.acceptedAt != null)
                    const Chip(
                      avatar: Icon(Icons.check, size: 16),
                      label: Text('Accepted'),
                      visualDensity: VisualDensity.compact,
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(_formatDate(item.createdAt), style: textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final TailoringStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      TailoringStatus.pending => ('In progress', Colors.blueGrey),
      TailoringStatus.completed => ('Completed', Colors.green),
      TailoringStatus.failed => ('Failed', Colors.red),
    };
    return Chip(
      label: Text(label, style: TextStyle(color: color.shade900)),
      backgroundColor: color.shade100,
      visualDensity: VisualDensity.compact,
      side: BorderSide.none,
    );
  }
}

const _months = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', //
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

String _formatDate(DateTime dateTime) {
  final local = dateTime.toLocal();
  return '${_months[local.month - 1]} ${local.day}, ${local.year}';
}
