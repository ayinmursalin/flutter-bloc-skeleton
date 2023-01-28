import 'package:bloc_skeleton/data/remote/responses/example/post_response.dart';
import 'package:bloc_skeleton/utils/typedef_util.dart';

abstract class ExampleRepository {
  FutureOrError<List<PostResponse>> getPosts();
}
