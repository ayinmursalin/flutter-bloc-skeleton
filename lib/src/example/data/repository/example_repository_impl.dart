import 'package:bloc_skeleton/src/example/data/remote/responses/post_response.dart';
import 'package:bloc_skeleton/src/example/data/remote/services/example_service.dart';
import 'package:bloc_skeleton/src/example/data/repository/example_repository.dart';
import 'package:bloc_skeleton/core/utils/future_util.dart';
import 'package:bloc_skeleton/core/utils/typedef_util.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  final ExampleService exampleService;

  ExampleRepositoryImpl(this.exampleService);

  @override
  FutureOrError<List<PostResponse>> getPosts() {
    return callOrError(() => exampleService.getPosts());
  }
}
