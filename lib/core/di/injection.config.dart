// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:resume_tailor/app/router/app_router.dart' as _i969;
import 'package:resume_tailor/core/network/auth_interceptor.dart' as _i480;
import 'package:resume_tailor/core/network/dio_client.dart' as _i711;
import 'package:resume_tailor/core/network/token_storage.dart' as _i318;
import 'package:resume_tailor/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i220;
import 'package:resume_tailor/features/auth/data/repositories/auth_repository_impl.dart'
    as _i916;
import 'package:resume_tailor/features/auth/domain/repositories/auth_repository.dart'
    as _i351;
import 'package:resume_tailor/features/auth/presentation/bloc/auth_bloc.dart'
    as _i527;
import 'package:resume_tailor/features/export/data/datasources/export_share_service.dart'
    as _i853;
import 'package:resume_tailor/features/export/presentation/cubit/export_cubit.dart'
    as _i378;
import 'package:resume_tailor/features/history/data/datasources/history_remote_data_source.dart'
    as _i810;
import 'package:resume_tailor/features/history/data/repositories/history_repository_impl.dart'
    as _i344;
import 'package:resume_tailor/features/history/domain/repositories/history_repository.dart'
    as _i429;
import 'package:resume_tailor/features/history/presentation/cubit/history_cubit.dart'
    as _i1031;
import 'package:resume_tailor/features/job_description/data/datasources/job_description_remote_data_source.dart'
    as _i288;
import 'package:resume_tailor/features/job_description/data/repositories/job_description_repository_impl.dart'
    as _i265;
import 'package:resume_tailor/features/job_description/domain/repositories/job_description_repository.dart'
    as _i886;
import 'package:resume_tailor/features/job_description/presentation/cubit/job_description_cubit.dart'
    as _i476;
import 'package:resume_tailor/features/resume_upload/data/datasources/resume_file_picker.dart'
    as _i588;
import 'package:resume_tailor/features/resume_upload/data/datasources/resume_remote_data_source.dart'
    as _i863;
import 'package:resume_tailor/features/resume_upload/data/repositories/resume_repository_impl.dart'
    as _i192;
import 'package:resume_tailor/features/resume_upload/domain/repositories/resume_repository.dart'
    as _i725;
import 'package:resume_tailor/features/resume_upload/presentation/cubit/resume_cubit.dart'
    as _i607;
import 'package:resume_tailor/features/tailoring/data/datasources/tailoring_remote_data_source.dart'
    as _i515;
import 'package:resume_tailor/features/tailoring/data/repositories/tailoring_repository_impl.dart'
    as _i549;
import 'package:resume_tailor/features/tailoring/domain/repositories/tailoring_repository.dart'
    as _i911;
import 'package:resume_tailor/features/tailoring/presentation/bloc/tailoring_bloc.dart'
    as _i775;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    final routerModule = _$RouterModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => networkModule.secureStorage,
    );
    gh.lazySingleton<_i588.ResumeFilePicker>(
      () => _i588.PlatformResumeFilePicker(),
    );
    gh.lazySingleton<_i853.ExportShareService>(
      () => _i853.SharePlusExportShareService(),
    );
    gh.lazySingleton<_i318.TokenStorage>(
      () => _i318.SecureTokenStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i480.AuthInterceptor>(
      () => _i480.AuthInterceptor(gh<_i318.TokenStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(gh<_i480.AuthInterceptor>()),
    );
    gh.factory<_i220.AuthRemoteDataSource>(
      () => _i220.AuthRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i810.HistoryRemoteDataSource>(
      () => _i810.HistoryRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i288.JobDescriptionRemoteDataSource>(
      () => _i288.JobDescriptionRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i863.ResumeRemoteDataSource>(
      () => _i863.ResumeRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i515.TailoringRemoteDataSource>(
      () => _i515.TailoringRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i725.ResumeRepository>(
      () => _i192.ResumeRepositoryImpl(gh<_i863.ResumeRemoteDataSource>()),
    );
    gh.lazySingleton<_i886.JobDescriptionRepository>(
      () => _i265.JobDescriptionRepositoryImpl(
        gh<_i288.JobDescriptionRemoteDataSource>(),
      ),
    );
    gh.factory<_i476.JobDescriptionCubit>(
      () => _i476.JobDescriptionCubit(gh<_i886.JobDescriptionRepository>()),
    );
    gh.lazySingleton<_i911.TailoringRepository>(
      () =>
          _i549.TailoringRepositoryImpl(gh<_i515.TailoringRemoteDataSource>()),
    );
    gh.lazySingleton<_i351.AuthRepository>(
      () => _i916.AuthRepositoryImpl(
        gh<_i220.AuthRemoteDataSource>(),
        gh<_i318.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i429.HistoryRepository>(
      () => _i344.HistoryRepositoryImpl(gh<_i810.HistoryRemoteDataSource>()),
    );
    gh.lazySingleton<_i527.AuthBloc>(
      () => _i527.AuthBloc(gh<_i351.AuthRepository>()),
    );
    gh.factory<_i1031.HistoryCubit>(
      () => _i1031.HistoryCubit(gh<_i429.HistoryRepository>()),
    );
    gh.factory<_i775.TailoringBloc>(
      () => _i775.TailoringBloc(gh<_i911.TailoringRepository>()),
    );
    gh.lazySingleton<_i583.GoRouter>(
      () => routerModule.router(gh<_i527.AuthBloc>()),
    );
    gh.factory<_i607.ResumeCubit>(
      () => _i607.ResumeCubit(
        gh<_i725.ResumeRepository>(),
        gh<_i588.ResumeFilePicker>(),
      ),
    );
    gh.factory<_i378.ExportCubit>(
      () => _i378.ExportCubit(
        gh<_i911.TailoringRepository>(),
        gh<_i853.ExportShareService>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i711.NetworkModule {}

class _$RouterModule extends _i969.RouterModule {}
