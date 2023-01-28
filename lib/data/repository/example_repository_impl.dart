import 'package:bloc_skeleton/data/remote/responses/example/post_response.dart';
import 'package:bloc_skeleton/data/remote/services/example_service.dart';
import 'package:bloc_skeleton/data/repository/example_repository.dart';
import 'package:bloc_skeleton/utils/future_util.dart';
import 'package:bloc_skeleton/utils/typedef_util.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  final ExampleService exampleService;

  ExampleRepositoryImpl(this.exampleService);

  @override
  FutureOrError<List<PostResponse>> getPosts() {
    return callOrError(() => exampleService.getPosts());
  }
}
