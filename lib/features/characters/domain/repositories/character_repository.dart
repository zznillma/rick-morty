import '../../../episodes/data/models/episode_model.dart';

import '../../data/models/characters_model.dart';

abstract class CharacterRepository {
  Future<CharacterModel> getCharacter(int page);

  Future<List<EpisodeResult>> getEpisode(CharacterResult model);
}
