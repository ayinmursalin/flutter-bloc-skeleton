import 'package:bloc_skeleton/data/remote/responses/example/post_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'example_service.g.dart';

@RestApi()
abstract class ExampleService {
  factory ExampleService(Dio dio) => _ExampleService(dio);

  @GET('/posts')
  Future<List<PostResponse>> getPosts();
}
