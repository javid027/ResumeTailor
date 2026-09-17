import 'package:dio/dio.dart';

import '../models/exported_file.dart';
import '../models/tailoring_result.dart';

enum ExportFormat {
  pdf,
  docx;

  String get value => name;
}

abstract class TailoringRepository {
  /// Requires explicit consent to send resume content to the LLM API. The
  /// job is always created — a failed LLM call still returns normally with
  /// `status: failed`, not a thrown exception.
  ///
  /// This is the one genuinely long-running, LLM-backed call in the app —
  /// pass [cancelToken] so the caller can let the user abort it.
  Future<TailoringResult> create({
    required String resumeId,
    required String jobDescriptionId,
    required bool consent,
    CancelToken? cancelToken,
  });

  Future<TailoringResult> get(String id);

  /// Only bulletIds whose diff status is `modified` are ever applied.
  Future<TailoringResult> accept(String id, {List<String> acceptedBulletIds = const []});

  Future<ExportedFile> export(String id, {required ExportFormat format});
}
