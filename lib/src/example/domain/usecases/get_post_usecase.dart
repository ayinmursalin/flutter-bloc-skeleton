import 'package:bloc_skeleton/src/example/data/repository/example_repository.dart';
import 'package:bloc_skeleton/src/example/domain/mapper/example_mapper.dart';
import 'package:bloc_skeleton/src/example/domain/models/post_dto.dart';
import 'package:bloc_skeleton/core/utils/typedef_util.dart';
import 'package:either_dart/either.dart';

class GetPostUseCase {
  final ExampleRepository repository;

  GetPostUseCase(this.repository);

  FutureOrError<List<PostDto>> execute() {
    return repository
        .getPosts()
        .mapRight((data) => data.map((e) => e.toDto()).toList());
  }
}
