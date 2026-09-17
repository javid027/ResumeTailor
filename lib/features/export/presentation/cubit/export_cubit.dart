import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/error/error_message_mapper.dart';
import '../../../tailoring/domain/repositories/tailoring_repository.dart';
import '../../data/datasources/export_share_service.dart';
import 'export_state.dart';

@injectable
class ExportCubit extends Cubit<ExportState> {
  ExportCubit(this._repository, this._shareService) : super(const ExportState.initial());

  final TailoringRepository _repository;
  final ExportShareService _shareService;

  Future<void> export(String tailoringId, ExportFormat format) async {
    emit(ExportState.exporting(format));
    try {
      final file = await _repository.export(tailoringId, format: format);
      await _shareService.share(file, format);
      emit(const ExportState.initial());
    } on ApiException catch (e) {
      emit(ExportState.failure(message: userMessageFor(e)));
    }
  }
}
