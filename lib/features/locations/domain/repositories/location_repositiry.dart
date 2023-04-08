import '../../../characters/data/models/characters_model.dart';
import '../../data/models/locations_model.dart';

abstract class LocationsRepository {
  Future<LocationsModel> getLocations();

  Future<List<CharacterResult>> getResident(Result model);
}
