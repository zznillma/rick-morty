import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';

import '../../../characters/data/models/characters_model.dart';

abstract class EpisodeRepository {
  Future<EpisodeModel> getEpisode(int page);
  
  Future<List<CharacterResult>> getCharacter(EpisodeResult model);
}
