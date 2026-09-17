import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../resume_upload/domain/models/resume_sections.dart';
import 'bullet_diff.dart';

part 'tailoring_result.freezed.dart';
part 'tailoring_result.g.dart';

enum TailoringStatus { pending, completed, failed }

@freezed
sealed class TailoringResult with _$TailoringResult {
  const factory TailoringResult({
    required String id,
    required String resumeId,
    required String jobDescriptionId,
    required ResumeSections originalSections,
    ResumeSections? tailoredSections,
    required List<BulletDiff> perBulletDiffs,
    required double atsScoreBefore,
    double? atsScoreAfter,
    required List<String> unmatchedRequirements,
    required TailoringStatus status,
    String? failureReason,
    required DateTime consentGivenAt,
    ResumeSections? finalSections,
    required List<String> acceptedBulletIds,
    DateTime? acceptedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TailoringResult;

  factory TailoringResult.fromJson(Map<String, dynamic> json) => _$TailoringResultFromJson(json);
}
