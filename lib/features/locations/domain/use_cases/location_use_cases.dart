// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';

import '../../../characters/data/models/characters_model.dart';
import '../../data/models/locations_model.dart';
import '../repositories/location_repositiry.dart';

@injectable
class LocationUseCases {
  final LocationsRepository locationsRepository;

  LocationUseCases({required this.locationsRepository});

  Future<LocationsModel> getLocations() async =>
      await locationsRepository.getLocations();

  Future<List<CharacterResult>> getResident(Result model) async =>
      await locationsRepository.getResident(model);
}
