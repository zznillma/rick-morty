// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';

import '../../../episodes/data/models/episode_model.dart';
import '../../data/models/characters_model.dart';
import '../repositories/character_repository.dart';

@injectable
class CharactherUseCases {
  final CharacterRepository characterRepository;

  CharactherUseCases({required this.characterRepository});

  Future<CharacterModel> getCharacter(int page) async =>
      await characterRepository.getCharacter(page);

  Future<List<EpisodeResult>> getEpisode(CharacterResult model) async =>
      await characterRepository.getEpisode(model);
}
