part of 'episode_bloc.dart';

@immutable
abstract class EpisodeEvent {}

class GetEpisodeEvent extends EpisodeEvent {}

class GetCharacterEvent extends EpisodeEvent {
  final EpisodeResult episodeModel;

  GetCharacterEvent({required this.episodeModel});
}
