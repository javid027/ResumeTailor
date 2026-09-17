import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience_entry.freezed.dart';
part 'experience_entry.g.dart';

@freezed
sealed class ExperienceEntry with _$ExperienceEntry {
  const factory ExperienceEntry({
    String? company,
    String? title,
    String? startDate,
    String? endDate,
    required List<String> bullets,
  }) = _ExperienceEntry;

  factory ExperienceEntry.fromJson(Map<String, dynamic> json) => _$ExperienceEntryFromJson(json);
}
