import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resume_tailor/core/error/api_exception.dart';
import 'package:resume_tailor/features/export/data/datasources/export_share_service.dart';
import 'package:resume_tailor/features/export/presentation/cubit/export_cubit.dart';
import 'package:resume_tailor/features/export/presentation/cubit/export_state.dart';
import 'package:resume_tailor/features/tailoring/domain/models/exported_file.dart';
import 'package:resume_tailor/features/tailoring/domain/repositories/tailoring_repository.dart';

class _MockTailoringRepository extends Mock implements TailoringRepository {}

class _MockExportShareService extends Mock implements ExportShareService {}

void main() {
  late _MockTailoringRepository repository;
  late _MockExportShareService shareService;

  final exportedFile = ExportedFile(bytes: Uint8List(0), filename: 'resume.pdf');

  setUpAll(() {
    registerFallbackValue(exportedFile);
    registerFallbackValue(ExportFormat.pdf);
  });

  setUp(() {
    repository = _MockTailoringRepository();
    shareService = _MockExportShareService();
  });

  blocTest<ExportCubit, ExportState>(
    'emits [exporting, initial] after fetching and sharing the file',
    build: () => ExportCubit(repository, shareService),
    setUp: () {
      when(() => repository.export(any(), format: any(named: 'format')))
          .thenAnswer((_) async => exportedFile);
      when(() => shareService.share(any(), any())).thenAnswer((_) async {});
    },
    act: (cubit) => cubit.export('tailoring-1', ExportFormat.pdf),
    expect: () => [const ExportState.exporting(ExportFormat.pdf), const ExportState.initial()],
    verify: (_) {
      verify(() => repository.export('tailoring-1', format: ExportFormat.pdf)).called(1);
      verify(() => shareService.share(exportedFile, ExportFormat.pdf)).called(1);
    },
  );

  blocTest<ExportCubit, ExportState>(
    'emits [exporting, failure] with a mapped message when the job is not exportable yet',
    build: () => ExportCubit(repository, shareService),
    setUp: () => when(() => repository.export(any(), format: any(named: 'format'))).thenThrow(
      const ApiException(
        code: 'TAILORING_NOT_EXPORTABLE',
        message: 'Nothing to export',
        details: {},
        statusCode: 400,
      ),
    ),
    act: (cubit) => cubit.export('tailoring-1', ExportFormat.docx),
    expect: () => [
      const ExportState.exporting(ExportFormat.docx),
      const ExportState.failure(
        message: 'There is nothing to export for this tailoring job yet.',
      ),
    ],
    verify: (_) => verifyNever(() => shareService.share(any(), any())),
  );
}
