import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resume_tailor/features/tailoring/presentation/widgets/ats_score_badge.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  testWidgets('shows only the before score while the job has not completed', (tester) async {
    await tester.pumpWidget(wrap(const AtsScoreBadge(before: 62)));

    expect(find.text('ATS score: 62'), findsOneWidget);
  });

  testWidgets('shows before, after, and a positive delta on improvement', (tester) async {
    await tester.pumpWidget(wrap(const AtsScoreBadge(before: 64, after: 84)));

    expect(find.text('ATS score: 64 → 84 (+20)'), findsOneWidget);
    expect(find.byIcon(Icons.trending_up), findsOneWidget);
  });

  testWidgets('shows a neutral icon when the score does not change', (tester) async {
    await tester.pumpWidget(wrap(const AtsScoreBadge(before: 64, after: 64)));

    expect(find.text('ATS score: 64 → 64 (0)'), findsOneWidget);
    expect(find.byIcon(Icons.speed), findsOneWidget);
  });
}
