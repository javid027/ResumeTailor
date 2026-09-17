import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_entry.freezed.dart';
part 'education_entry.g.dart';

@freezed
sealed class EducationEntry with _$EducationEntry {
  const factory EducationEntry({
    String? institution,
    String? degree,
    String? startDate,
    String? endDate,
  }) = _EducationEntry;

  factory EducationEntry.fromJson(Map<String, dynamic> json) => _$EducationEntryFromJson(json);
}
