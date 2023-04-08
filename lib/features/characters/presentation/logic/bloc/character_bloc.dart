import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../internal/helpers/catch_exception_helper.dart';
import '../../../../episodes/data/models/episode_model.dart';

import '../../../data/models/characters_model.dart';
import '../../../domain/use_cases/character_use_cases.dart';

part 'character_event.dart';
part 'character_state.dart';

@injectable
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharactherUseCases useCases;

  CharacterBloc(this.useCases) : super(CharacterInitial()) {
    on<CharacterEvent>((event, emit) {});

    on<GetCharacterEvent>((event, emit) async {
      emit(CharacterLoadingState());
      print('123');

      await useCases
          .getCharacter()
          .then((characterModel) =>
              emit(CharacterLoadedState(characterModel: characterModel)))
          .onError((error, stackTrace) => emit(CharacterErrorState(
              error: CatchException.convertException(error))));
    });

    on<GetCharacterEpisodeEvent>((event, emit) async {
      emit(CharacterLoadingState());
      print('123');

      await useCases
          .getEpisode(event.characterModel)
          .then((characterEpisodeModel) => emit(
              EpisodeLoadedState(characterEpisodeModel: characterEpisodeModel)))
          .onError((error, stackTrace) => emit(CharacterErrorState(
              error: CatchException.convertException(error))));
    });
  }
}
