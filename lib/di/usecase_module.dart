import 'package:bloc_skeleton/data/repository/example_repository.dart';
import 'package:bloc_skeleton/domain/usecases/example/get_post_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UseCaseModule {
  @injectable
  GetPostUseCase getPostUseCase(ExampleRepository repository) {
    return GetPostUseCase(repository);
  }
}
