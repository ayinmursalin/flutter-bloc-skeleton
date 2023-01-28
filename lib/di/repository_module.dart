import 'package:bloc_skeleton/data/repository/example_repository.dart';
import 'package:bloc_skeleton/data/repository/example_repository_impl.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  @Singleton(as: ExampleRepository)
  ExampleRepositoryImpl get exampleRepository;
}
