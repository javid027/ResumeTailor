import 'package:flutter_test/flutter_test.dart';
import 'package:resume_tailor/features/tailoring/domain/models/bullet_diff.dart';
import 'package:resume_tailor/features/tailoring/domain/models/tailoring_result.dart';

void main() {
  // Mirrors a completed job response from POST /tailoring in openapi.yaml,
  // including a guardrail-flagged bullet that must never be exposed as applied.
  final json = {
    'id': '11111111-1111-1111-1111-111111111111',
    'resumeId': '22222222-2222-2222-2222-222222222222',
    'jobDescriptionId': '33333333-3333-3333-3333-333333333333',
    'originalSections': {
      'parsedContact': {'name': 'Jane Doe', 'email': null, 'phone': null, 'location': null},
      'summary': 'Experienced engineer.',
      'experience': [
        {
          'company': 'Acme',
          'title': 'Engineer',
          'startDate': '2020-01',
          'endDate': null,
          'bullets': ['Shipped the widget pipeline.'],
        },
      ],
      'education': <Map<String, dynamic>>[],
      'skills': ['Dart', 'Flutter'],
    },
    'tailoredSections': null,
    'perBulletDiffs': [
      {
        'sectionId': 'experience-0',
        'bulletId': 'experience-0-bullet-0',
        'original': 'Shipped the widget pipeline.',
        'suggested': 'Shipped the widget pipeline used by 10 Fortune 500 clients.',
        'status': 'flagged_invented',
      },
    ],
    'atsScoreBefore': 42,
    'atsScoreAfter': null,
    'unmatchedRequirements': ['Kubernetes'],
    'status': 'failed',
    'failureReason': 'LLM timeout',
    'consentGivenAt': '2026-09-16T10:00:00.000Z',
    'finalSections': null,
    'acceptedBulletIds': <String>[],
    'acceptedAt': null,
    'createdAt': '2026-09-16T10:00:00.000Z',
    'updatedAt': '2026-09-16T10:00:05.000Z',
  };

  test('fromJson parses the flagged_invented guardrail status', () {
    final result = TailoringResult.fromJson(json);

    expect(result.status, TailoringStatus.failed);
    expect(result.perBulletDiffs.single.status, BulletDiffStatus.flaggedInvented);
    expect(result.tailoredSections, isNull);
    expect(result.atsScoreBefore, 42.0);
    expect(result.originalSections.experience!.single.company, 'Acme');
  });

  test('toJson round-trips the enum values back to the wire format', () {
    final result = TailoringResult.fromJson(json);

    final encoded = result.toJson();

    expect(encoded['status'], 'failed');
    expect((encoded['perBulletDiffs'] as List).single['status'], 'flagged_invented');
  });
}
