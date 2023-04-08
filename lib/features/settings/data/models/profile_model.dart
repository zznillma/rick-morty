// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileModel {
  String name;
  String surname;
  String? patronymic;
  String login;
  String image;
  String? selfInfo;

  ProfileModel({
    required this.name,
    required this.surname,
    this.patronymic,
    required this.login,
    required this.image,
    this.selfInfo,
  });
}
