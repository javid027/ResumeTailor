import 'package:flutter/material.dart';

/// Shows the keyword-coverage ATS score (0-100) computed before tailoring,
/// and — once the job has completed — the score after, with a delta.
class AtsScoreBadge extends StatelessWidget {
  const AtsScoreBadge({super.key, required this.before, this.after});

  final double before;
  final double? after;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final after = this.after;

    if (after == null) {
      return _Badge(
        color: scheme.secondaryContainer,
        onColor: scheme.onSecondaryContainer,
        icon: Icons.speed,
        label: 'ATS score: ${before.round()}',
      );
    }

    final delta = after - before;
    final improved = delta > 0;
    final unchanged = delta == 0;
    final color = unchanged
        ? scheme.secondaryContainer
        : improved
            ? Colors.green.shade100
            : scheme.errorContainer;
    final onColor = unchanged
        ? scheme.onSecondaryContainer
        : improved
            ? Colors.green.shade900
            : scheme.onErrorContainer;

    return _Badge(
      color: color,
      onColor: onColor,
      icon: unchanged
          ? Icons.speed
          : improved
              ? Icons.trending_up
              : Icons.trending_down,
      label: 'ATS score: ${before.round()} → ${after.round()}'
          ' (${improved ? '+' : ''}${delta.round()})',
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.color,
    required this.onColor,
    required this.icon,
    required this.label,
  });

  final Color color;
  final Color onColor;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: onColor),
            const SizedBox(width: 8),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: onColor, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
