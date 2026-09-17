import 'package:flutter/material.dart';

import '../../../resume_upload/domain/models/resume_sections.dart';

/// A read-only preview of a tailored [ResumeSections] (`finalSections` once
/// accepted, or `tailoredSections` before that).
///
/// This is intentionally not an editor despite the name matching the
/// planned file — there is no endpoint to persist arbitrary edits to a
/// tailoring result's sections. Editing the *source* resume goes through
/// `PATCH /resumes/{id}` (the resume upload feature); editing *which*
/// suggestions apply happens via the diff view's accept/reject toggles.
/// A free-text editor here would silently discard whatever the user typed.
class SectionEditor extends StatelessWidget {
  const SectionEditor({super.key, required this.sections});

  final ResumeSections sections;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final summary = sections.summary;
    final skills = sections.skills ?? const [];
    final experience = sections.experience ?? const [];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (summary != null && summary.isNotEmpty) ...[
          Text('Summary', style: textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(summary),
          const SizedBox(height: 20),
        ],
        if (skills.isNotEmpty) ...[
          Text('Skills', style: textTheme.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [for (final skill in skills) Chip(label: Text(skill))],
          ),
          const SizedBox(height: 20),
        ],
        if (experience.isNotEmpty) ...[
          Text('Experience', style: textTheme.titleMedium),
          const SizedBox(height: 8),
          for (final entry in experience)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    [entry.title, entry.company].whereType<String>().join(' at '),
                    style: textTheme.titleSmall,
                  ),
                  if (entry.startDate != null || entry.endDate != null)
                    Text(
                      '${entry.startDate ?? ''} – ${entry.endDate ?? 'Present'}',
                      style: textTheme.bodySmall,
                    ),
                  const SizedBox(height: 4),
                  for (final bullet in entry.bullets)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('•  '),
                          Expanded(child: Text(bullet)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
        ],
      ],
    );
  }
}
