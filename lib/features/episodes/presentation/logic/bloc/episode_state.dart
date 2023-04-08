// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'episode_bloc.dart';

@immutable
abstract class EpisodeState {}

class EpisodeInitial extends EpisodeState {}

//! ////////////////////////////////////////

class EpisodeLoadedState extends EpisodeState {
  final EpisodeModel episodeModel;

  EpisodeLoadedState({required this.episodeModel});
}

class LoadingState extends EpisodeState {}

class ErrorState extends EpisodeState {
  CatchException error;

  ErrorState({required this.error});
}

class CharacterLoadedState extends EpisodeState {
  List<CharacterResult> characterModel;

  CharacterLoadedState({required this.characterModel});
}
