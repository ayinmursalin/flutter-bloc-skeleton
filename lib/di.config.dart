// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_skeleton/core/data/local/app_preferences.dart' as _i5;
import 'package:bloc_skeleton/core/data/remote/interceptors/auth_interceptor.dart'
    as _i3;
import 'package:bloc_skeleton/core/di/local_module.dart' as _i10;
import 'package:bloc_skeleton/core/di/network_module.dart' as _i11;
import 'package:bloc_skeleton/src/example/data/remote/services/example_service.dart'
    as _i7;
import 'package:bloc_skeleton/src/example/data/repository/example_repository.dart'
    as _i8;
import 'package:bloc_skeleton/src/example/data/repository/example_repository_impl.dart'
    as _i13;
import 'package:bloc_skeleton/src/example/di/example_di_module.dart' as _i12;
import 'package:bloc_skeleton/src/example/domain/usecases/get_post_usecase.dart'
    as _i9;
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final localModule = _$LocalModule();
    final exampleDiModule = _$ExampleDiModule(this);
    gh.singleton<_i3.AuthInterceptor>(networkModule.authInterceptor);
    await gh.singletonAsync<_i4.SharedPreferences>(
      () => localModule.prefs,
      preResolve: true,
    );
    gh.singleton<String>(
      networkModule.baseUrl,
      instanceName: 'base_url',
    );
    gh.singleton<_i5.AppPreferences>(
        localModule.appPreferences(gh<_i4.SharedPreferences>()));
    gh.singleton<_i6.Dio>(networkModule.dio(
      gh<String>(instanceName: 'base_url'),
      gh<_i3.AuthInterceptor>(),
    ));
    gh.singleton<_i7.ExampleService>(
        exampleDiModule.exampleService(gh<_i6.Dio>()));
    gh.singleton<_i8.ExampleRepository>(exampleDiModule.exampleRepository);
    gh.factory<_i9.GetPostUseCase>(
        () => exampleDiModule.getPostUseCase(gh<_i8.ExampleRepository>()));
    return this;
  }
}

class _$LocalModule extends _i10.LocalModule {}

class _$NetworkModule extends _i11.NetworkModule {}

class _$ExampleDiModule extends _i12.ExampleDiModule {
  _$ExampleDiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i13.ExampleRepositoryImpl get exampleRepository =>
      _i13.ExampleRepositoryImpl(_getIt<_i7.ExampleService>());
}
