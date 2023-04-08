// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/settings/data/models/profile_model.dart';
import 'package:rick_and_morty/features/settings/domain/repositories/profile_repository.dart';
@injectable
class ProfileUseCases {
  final ProfileRepository profileRepository;

  ProfileUseCases({required this.profileRepository});

  Future<ProfileModel> getProfile() async =>
      await profileRepository.getProfile();
}
