// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'episode_bloc.dart';

@immutable
abstract class EpisodeEvent {}

class GetEpisodeEvent extends EpisodeEvent {
  final bool isFirstCall;
  final int page;

  GetEpisodeEvent({
    this.isFirstCall = false,
    required this.page,
  });
}

class GetCharacterEvent extends EpisodeEvent {
  final EpisodeResult episodeModel;

  GetCharacterEvent({required this.episodeModel});
}
