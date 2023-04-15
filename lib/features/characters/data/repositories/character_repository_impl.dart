import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:rick_and_morty/internal/helpers/api_requester.dart';

import '../../../../internal/helpers/catch_exception_helper.dart';
import '../../../episodes/data/models/episode_model.dart';
import '../../domain/repositories/character_repository.dart';

import '../models/characters_model.dart';

@Injectable(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<CharacterModel> getCharacter(int page) async {
    try {
      Response response = await apiRequester.toGet(
        'character',
        param: {'page': page},
      );

      if (response.statusCode == 200) {
        return CharacterModel.fromJson(response.data);
      }

      throw CatchException.convertException(response);
    } catch (e) {
      print('error === $e');
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<List<EpisodeResult>> getEpisode(CharacterResult model) async {
    try {
      List<EpisodeResult> episodeModelList = [];

      for (var element in model.episode!) {
        Response response =
            await apiRequester.toGet('episode/${element.substring(40)}');

        episodeModelList.add(EpisodeResult.fromJson(response.data));
      }
      return episodeModelList;
    } catch (e) {
      print('error === $e');
      throw CatchException.convertException(e);
    }
  }
}




/* 
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/rick_and_morty/data/models/characters_model.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/internal/helpers/api_requester.dart';

import '../../../../internal/helpers/catch_exception_helper.dart';

@Injectable(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<CharacterModel> getCharacter() async {
    try {
      Response response = await apiRequester.toGet('character');

      if (response.statusCode == 200) {
        return CharacterModel.fromJson(response.data);
      }

      throw CatchException.convertException(response);
    } catch (e) {
      print('error === $e');
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<CharacterModel> getEpisode(CharacterResult model) async {
    try {
      late Response response;

      for (var element in model.episode!) {
        response = await apiRequester.toGet('episode/${element.substring(40)}');

        if (response.statusCode == 200) {
          response.data['characters'].forEach((elem) async {
            response =
                await apiRequester.toGet('character/${elem.substring(42)}');

            log('character ==== ${response.data}');
          });

          return CharacterModel.fromJson(response.data);
        }
      }

      throw CatchException.convertException(response);
    } catch (e) {
      print('error === $e');
      throw CatchException.convertException(e);
    }
  }
}

*/
