import '../../../episodes/data/models/episode_model.dart';

import '../../data/models/characters_model.dart';

abstract class CharacterRepository {
  Future<CharacterModel> getCharacter();

  Future<List<EpisodeResult>> getEpisode(CharacterResult model);
}
