import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_description.freezed.dart';
part 'job_description.g.dart';

@freezed
sealed class JobDescription with _$JobDescription {
  const factory JobDescription({
    required String id,
    required String userId,
    required String rawText,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<String>? keywords,
    List<String>? requirements,
  }) = _JobDescription;

  factory JobDescription.fromJson(Map<String, dynamic> json) => _$JobDescriptionFromJson(json);
}
