import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:rick_and_morty/internal/helpers/api_requester.dart';

import '../../../../internal/helpers/catch_exception_helper.dart';
import '../../domain/repositories/location_repositiry.dart';
import '../../../characters/data/models/characters_model.dart';
import '../models/locations_model.dart';

@Injectable(as: LocationsRepository)
class LocationsRepositoryImpl implements LocationsRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<LocationsModel> getLocations(int page) async {
    try {
      Response response = await apiRequester.toGet(
        'location',
        param: {'page': page},
      );

      if (response.statusCode == 200) {
        return LocationsModel.fromJson(response.data);
      }
      throw CatchException.convertException(response);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<List<CharacterResult>> getResident(Result model) async {
    try {
      List<CharacterResult> residentModelList = [];

      for (var element in model.residents!) {
        Response response =
            await apiRequester.toGet('character/${element.substring(42)}');

        residentModelList.add(CharacterResult.fromJson(response.data));
      }
      return residentModelList;
    } catch (e) {
      print('error === $e');
      throw CatchException.convertException(e);
    }
  }
}
