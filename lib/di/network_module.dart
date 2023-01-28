import 'package:bloc_skeleton/data/remote/interceptors/auth_interceptor.dart';
import 'package:bloc_skeleton/data/remote/services/example_service.dart';
import 'package:bloc_skeleton/utils/date_time_util.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named('base_url')
  @singleton
  String get baseUrl => 'https://jsonplaceholder.typicode.com/';

  @singleton
  AuthInterceptor get authInterceptor => AuthInterceptor();

  @singleton
  Dio dio(
    @Named('base_url') String baseUrl,
    AuthInterceptor authInterceptor,
  ) {
    var option = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: DateTimeUtil.fifteenSeconds,
      sendTimeout: DateTimeUtil.fifteenSeconds,
      receiveTimeout: DateTimeUtil.fifteenSeconds,
    );

    var dio = Dio(option);
    dio.interceptors.add(authInterceptor);

    return dio;
  }

  /// Register Services
  @singleton
  ExampleService exampleService(Dio dio) => ExampleService(dio);
}
