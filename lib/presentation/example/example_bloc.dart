import 'package:bloc/bloc.dart';
import 'package:bloc_skeleton/domain/models/common/error_dto.dart';
import 'package:bloc_skeleton/domain/models/example/post_dto.dart';
import 'package:bloc_skeleton/domain/usecases/example/get_post_usecase.dart';
import 'package:equatable/equatable.dart';

part 'example_event.dart';

part 'example_state.dart';

/// Bloc
class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  final GetPostUseCase getPostUseCase;

  ExampleStateData stateData = const ExampleStateData();

  ExampleBloc({
    required this.getPostUseCase,
  }) : super(const ExampleInitialState()) {
    on<ExampleInitEvent>(_onInitExample);
    on<ExampleGetPostEvent>(_onExampleGetPostEvent);
    on<ExampleIncrementEvent>(_onExampleIncrementEvent);
  }

  void _onInitExample(
    ExampleInitEvent event,
    Emitter<ExampleState> emit,
  ) {
    emit(const ExampleInitialState());
  }

  void _onExampleGetPostEvent(
    ExampleGetPostEvent event,
    Emitter<ExampleState> emit,
  ) async {
    emit(ExampleLoadingState(stateData));

    var result = await getPostUseCase.execute();

    result.fold((ErrorDto error) {
      stateData = stateData.copyWith(error: error);

      emit(ExampleErrorState(stateData.copyWith(error: error)));
    }, (data) {
      stateData = stateData.copyWith(
        posts: data,
        error: null,
      );

      emit(ExampleDisplayPostsState(stateData));
    });
  }

  void _onExampleIncrementEvent(
    ExampleIncrementEvent event,
    Emitter<ExampleState> emit,
  ) {
    stateData = stateData.copyWith(
      incrementValue: stateData.incrementValue + 2,
    );

    emit(ExampleDisplayValueState(stateData));
  }
}
