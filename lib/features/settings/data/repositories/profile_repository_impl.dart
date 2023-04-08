import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/settings/data/models/profile_model.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception_helper.dart';

import '../../domain/repositories/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<ProfileModel> getProfile() async {
    try {
      ProfileModel profileModel = ProfileModel(
        name: 'Bektur',
        surname: 'Dzhumabekov',
        patronymic: 'Tabaldyevich',
        selfInfo: 'Hello World',
        login: 'zznillma',
        image: 'assets/images/morty.jpeg',
      );

      return profileModel;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
