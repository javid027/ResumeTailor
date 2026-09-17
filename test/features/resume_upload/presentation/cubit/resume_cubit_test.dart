import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resume_tailor/core/error/api_exception.dart';
import 'package:resume_tailor/features/resume_upload/data/datasources/resume_file_picker.dart';
import 'package:resume_tailor/features/resume_upload/domain/models/resume.dart';
import 'package:resume_tailor/features/resume_upload/domain/repositories/resume_repository.dart';
import 'package:resume_tailor/features/resume_upload/presentation/cubit/resume_cubit.dart';
import 'package:resume_tailor/features/resume_upload/presentation/cubit/resume_state.dart';

class _MockResumeRepository extends Mock implements ResumeRepository {}

class _MockResumeFilePicker extends Mock implements ResumeFilePicker {}

void main() {
  late _MockResumeRepository repository;
  late _MockResumeFilePicker filePicker;

  final resume = Resume(
    id: 'resume-1',
    userId: 'user-1',
    rawFileUrl: 'internal://storage/resume.pdf',
    createdAt: DateTime(2026, 9, 16),
    updatedAt: DateTime(2026, 9, 16),
    summary: 'Experienced engineer.',
    skills: const ['Dart'],
  );

  setUpAll(() {
    registerFallbackValue(Uint8List(0));
  });

  setUp(() {
    repository = _MockResumeRepository();
    filePicker = _MockResumeFilePicker();
  });

  group('pickAndUpload', () {
    blocTest<ResumeCubit, ResumeState>(
      'stays initial when the user cancels the picker',
      build: () => ResumeCubit(repository, filePicker),
      setUp: () => when(() => filePicker.pickResumeFile()).thenAnswer((_) async => null),
      act: (cubit) => cubit.pickAndUpload(),
      expect: () => <ResumeState>[],
    );

    blocTest<ResumeCubit, ResumeState>(
      'emits [uploading, loaded] on a successful upload',
      build: () => ResumeCubit(repository, filePicker),
      setUp: () {
        when(() => filePicker.pickResumeFile()).thenAnswer(
          (_) async => PickedResumeFile(bytes: Uint8List(0), fileName: 'resume.pdf'),
        );
        when(() => repository.uploadResume(
              fileBytes: any(named: 'fileBytes'),
              fileName: any(named: 'fileName'),
            )).thenAnswer((_) async => resume);
      },
      act: (cubit) => cubit.pickAndUpload(),
      expect: () => [const ResumeState.uploading(), ResumeState.loaded(resume: resume)],
    );

    blocTest<ResumeCubit, ResumeState>(
      'emits [uploading, uploadFailure] with a mapped message when the server rejects the file',
      build: () => ResumeCubit(repository, filePicker),
      setUp: () {
        when(() => filePicker.pickResumeFile()).thenAnswer(
          (_) async => PickedResumeFile(bytes: Uint8List(0), fileName: 'resume.exe'),
        );
        when(() => repository.uploadResume(
              fileBytes: any(named: 'fileBytes'),
              fileName: any(named: 'fileName'),
            )).thenThrow(const ApiException(
          code: 'RESUME_INVALID_FILE_TYPE',
          message: 'Unsupported file type',
          details: {},
          statusCode: 400,
        ));
      },
      act: (cubit) => cubit.pickAndUpload(),
      expect: () => [
        const ResumeState.uploading(),
        const ResumeState.uploadFailure(message: 'Please upload a PDF or DOCX file.'),
      ],
    );
  });

  group('saveChanges', () {
    final edited = resume.copyWith(summary: 'Updated summary.');

    blocTest<ResumeCubit, ResumeState>(
      'emits [saving, loaded] on a successful patch',
      build: () => ResumeCubit(repository, filePicker),
      setUp: () => when(() => repository.patchResume(
            any(),
            parsedContact: any(named: 'parsedContact'),
            summary: any(named: 'summary'),
            experience: any(named: 'experience'),
            education: any(named: 'education'),
            skills: any(named: 'skills'),
          )).thenAnswer((_) async => edited),
      act: (cubit) => cubit.saveChanges(edited),
      expect: () => [ResumeState.saving(resume: edited), ResumeState.loaded(resume: edited)],
    );

    blocTest<ResumeCubit, ResumeState>(
      'emits [saving, saveFailure] and keeps the draft on failure',
      build: () => ResumeCubit(repository, filePicker),
      setUp: () => when(() => repository.patchResume(
            any(),
            parsedContact: any(named: 'parsedContact'),
            summary: any(named: 'summary'),
            experience: any(named: 'experience'),
            education: any(named: 'education'),
            skills: any(named: 'skills'),
          )).thenThrow(const ApiException(
        code: 'RESUME_NOT_FOUND',
        message: 'Resume not found',
        details: {},
        statusCode: 404,
      )),
      act: (cubit) => cubit.saveChanges(edited),
      expect: () => [
        ResumeState.saving(resume: edited),
        ResumeState.saveFailure(resume: edited, message: 'That resume could not be found.'),
      ],
    );
  });
}
