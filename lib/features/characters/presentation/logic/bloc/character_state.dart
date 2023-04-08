// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterLoadedState extends CharacterState {
  final CharacterModel characterModel;

  CharacterLoadedState({required this.characterModel});
}

class CharacterErrorState extends CharacterState {
  final CatchException error;

  CharacterErrorState({required this.error});
}

class EpisodeLoadedState extends CharacterState {
  final List<EpisodeResult> characterEpisodeModel;

  EpisodeLoadedState({required this.characterEpisodeModel});
}
