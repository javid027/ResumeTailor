import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resume_tailor/features/resume_upload/domain/models/resume_sections.dart';
import 'package:resume_tailor/features/tailoring/domain/models/bullet_diff.dart';
import 'package:resume_tailor/features/tailoring/domain/models/tailoring_result.dart';
import 'package:resume_tailor/features/tailoring/presentation/widgets/diff_view.dart';

void main() {
  // Captured verbatim from a real completed job against the live backend
  // (see the Slice 6 Build Log entry) — including the guardrail actually
  // blocking a fabricated summary claim, and the `skills` bullet's
  // JSON-encoded-array-as-a-string quirk.
  final result = TailoringResult(
    id: 'a0d09043-e2c2-4123-9f60-193da6b4fb22',
    resumeId: 'resume-1',
    jobDescriptionId: 'jd-1',
    originalSections: const ResumeSections(),
    perBulletDiffs: const [
      BulletDiff(
        sectionId: 'summary',
        bulletId: 'summary',
        original:
            'Experienced software engineer with 5 years building backend services and web applications.',
        suggested:
            'Experienced Senior Software Engineer with 5 years of expertise in building backend '
            'services and web applications, including optimizing database queries and developing '
            'REST APIs.',
        status: BulletDiffStatus.flaggedInvented,
      ),
      BulletDiff(
        sectionId: 'skills',
        bulletId: 'skills',
        original: '["JavaScript","TypeScript","Node.js","PostgreSQL","Docker","AWS"]',
        suggested: '["Node.js","PostgreSQL","AWS","Docker","JavaScript","TypeScript"]',
        status: BulletDiffStatus.modified,
      ),
    ],
    atsScoreBefore: 64,
    atsScoreAfter: 64,
    unmatchedRequirements: const ['Kubernetes, plus.'],
    status: TailoringStatus.completed,
    consentGivenAt: DateTime(2026, 9, 16),
    acceptedBulletIds: const [],
    createdAt: DateTime(2026, 9, 16),
    updatedAt: DateTime(2026, 9, 16),
  );

  Widget buildSubject({required Set<String> selected, required ValueChanged<String> onToggle}) {
    return MaterialApp(
      home: Scaffold(
        body: DiffView(result: result, selectedBulletIds: selected, onToggle: onToggle),
      ),
    );
  }

  testWidgets('renders the flagged summary as blocked, without a checkbox to accept it', (tester) async {
    await tester.pumpWidget(buildSubject(selected: {}, onToggle: (_) {}));

    expect(
      find.text('Blocked — could not be verified against your original resume'),
      findsOneWidget,
    );
    // Only the skills row is toggleable, so exactly one checkbox should exist.
    expect(find.byType(Checkbox), findsOneWidget);
  });

  testWidgets('renders the skills diff as a comma-joined list, not raw JSON', (tester) async {
    await tester.pumpWidget(buildSubject(selected: {}, onToggle: (_) {}));

    expect(find.textContaining('JavaScript, TypeScript'), findsWidgets);
    expect(find.textContaining('["JavaScript"'), findsNothing);
  });

  testWidgets('tapping the checkbox reports the modified bulletId', (tester) async {
    String? toggled;
    await tester.pumpWidget(buildSubject(selected: {}, onToggle: (id) => toggled = id));

    await tester.tap(find.byType(Checkbox));

    expect(toggled, 'skills');
  });

  testWidgets('reflects the current selection in the checkbox state', (tester) async {
    await tester.pumpWidget(buildSubject(selected: {'skills'}, onToggle: (_) {}));

    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
    expect(checkbox.value, isTrue);
  });

  testWidgets('disables toggling when enabled is false', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: DiffView(
          result: result,
          selectedBulletIds: const {},
          onToggle: (_) {},
          enabled: false,
        ),
      ),
    ));

    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
    expect(checkbox.onChanged, isNull);
  });
}
