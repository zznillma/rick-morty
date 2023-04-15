import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty/features/episodes/domain/use_cases/episode_use_cases.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception_helper.dart';

import '../../../../characters/data/models/characters_model.dart';

part 'episode_event.dart';
part 'episode_state.dart';

@injectable
class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final EpisodeUseCases useCases;

  EpisodeBloc(this.useCases) : super(EpisodeInitial()) {
    on<EpisodeEvent>((event, emit) {});

    on<GetEpisodeEvent>((event, emit) async {
      if (event.isFirstCall) {
        emit(LoadingState());
      }

      await useCases
          .getEpisode(event.page)
          .then((episodeModel) =>
              emit(EpisodeLoadedState(episodeModel: episodeModel)))
          .onError((error, stackTrace) =>
              emit(ErrorState(error: CatchException.convertException(error))));
    });

    on<GetCharacterEvent>((event, emit) async {
      emit(LoadingState());

      await useCases
          .getCharacter(event.episodeModel)
          .then((characterModel) =>
              emit(CharacterLoadedState(characterModel: characterModel)))
          .onError((error, stackTrace) =>
              emit(ErrorState(error: CatchException.convertException(error))));
    });
  }
}
