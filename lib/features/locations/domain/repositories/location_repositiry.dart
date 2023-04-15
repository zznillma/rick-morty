import '../../../characters/data/models/characters_model.dart';
import '../../data/models/locations_model.dart';

abstract class LocationsRepository {
  Future<LocationsModel> getLocations(int page);

  Future<List<CharacterResult>> getResident(Result model);
}
