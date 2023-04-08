import 'package:rick_and_morty/features/settings/data/models/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getProfile();
}
