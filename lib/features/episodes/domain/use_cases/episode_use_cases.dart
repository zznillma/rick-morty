// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty/features/episodes/domain/repositories/episode_repository.dart';

import '../../../characters/data/models/characters_model.dart';

@injectable
class EpisodeUseCases {
  final EpisodeRepository episodeRepository;

  EpisodeUseCases({required this.episodeRepository});

  Future<EpisodeModel> getEpisode(int page) async =>
      await episodeRepository.getEpisode(page);

  Future<List<CharacterResult>> getCharacter(EpisodeResult model) async =>
      await episodeRepository.getCharacter(model);
}
