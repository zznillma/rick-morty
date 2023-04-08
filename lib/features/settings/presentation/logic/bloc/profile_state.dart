// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final ProfileModel profileModel;

  ProfileLoadedState({required this.profileModel});
}

class ProfileErrorState extends ProfileState {
  final CatchException error;

  ProfileErrorState({required this.error});
}
