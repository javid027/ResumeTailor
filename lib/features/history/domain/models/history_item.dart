import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../tailoring/domain/models/tailoring_result.dart';

part 'history_item.freezed.dart';
part 'history_item.g.dart';

@freezed
sealed class HistoryItemResume with _$HistoryItemResume {
  const factory HistoryItemResume({
    required String id,
    String? name,
  }) = _HistoryItemResume;

  factory HistoryItemResume.fromJson(Map<String, dynamic> json) =>
      _$HistoryItemResumeFromJson(json);
}

@freezed
sealed class HistoryItemJobDescription with _$HistoryItemJobDescription {
  const factory HistoryItemJobDescription({
    required String id,
    required String excerpt,
    List<String>? keywords,
  }) = _HistoryItemJobDescription;

  factory HistoryItemJobDescription.fromJson(Map<String, dynamic> json) =>
      _$HistoryItemJobDescriptionFromJson(json);
}

@freezed
sealed class HistoryItem with _$HistoryItem {
  const factory HistoryItem({
    required String id,
    required TailoringStatus status,
    required double atsScoreBefore,
    double? atsScoreAfter,
    required List<String> unmatchedRequirements,
    required DateTime createdAt,
    DateTime? acceptedAt,
    required HistoryItemResume resume,
    required HistoryItemJobDescription jobDescription,
  }) = _HistoryItem;

  factory HistoryItem.fromJson(Map<String, dynamic> json) => _$HistoryItemFromJson(json);
}
