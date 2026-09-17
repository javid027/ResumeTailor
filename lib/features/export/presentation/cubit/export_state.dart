import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../tailoring/domain/repositories/tailoring_repository.dart';

part 'export_state.freezed.dart';

@freezed
sealed class ExportState with _$ExportState {
  const factory ExportState.initial() = ExportInitial;

  const factory ExportState.exporting(ExportFormat format) = ExportInProgress;

  const factory ExportState.failure({required String message}) = ExportFailure;
}
