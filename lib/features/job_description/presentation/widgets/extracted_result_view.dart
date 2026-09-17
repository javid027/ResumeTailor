import 'package:flutter/material.dart';

import '../../domain/models/job_description.dart';

class ExtractedResultView extends StatelessWidget {
  const ExtractedResultView({
    super.key,
    required this.jobDescription,
    required this.onStartOver,
    this.onTailor,
  });

  final JobDescription jobDescription;
  final VoidCallback onStartOver;
  final VoidCallback? onTailor;

  @override
  Widget build(BuildContext context) {
    final keywords = jobDescription.keywords ?? const [];
    final requirements = jobDescription.requirements ?? const [];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Keywords', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        if (keywords.isEmpty)
          const Text('No keywords were extracted.')
        else
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [for (final keyword in keywords) Chip(label: Text(keyword))],
          ),
        const SizedBox(height: 24),
        Text('Requirements', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        if (requirements.isEmpty)
          const Text('No requirements were extracted.')
        else
          for (final requirement in requirements)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('•  '),
                  Expanded(child: Text(requirement)),
                ],
              ),
            ),
        const SizedBox(height: 24),
        ExpansionTile(
          title: const Text('Original text'),
          tilePadding: EdgeInsets.zero,
          childrenPadding: const EdgeInsets.only(bottom: 12),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(jobDescription.rawText),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (onTailor != null) ...[
          FilledButton.icon(
            onPressed: onTailor,
            icon: const Icon(Icons.auto_awesome),
            label: const Text('Tailor my resume'),
          ),
          const SizedBox(height: 12),
        ],
        OutlinedButton(
          onPressed: onStartOver,
          child: const Text('Paste a different job description'),
        ),
      ],
    );
  }
}
