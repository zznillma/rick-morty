// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'locations_bloc.dart';

@immutable
abstract class LocationsState {}

class LocationsInitial extends LocationsState {}

class LocationLoadingState extends LocationsState {}

class LocationLoadedState extends LocationsState {
  final LocationsModel locationsModel;

  LocationLoadedState({required this.locationsModel});
}

class LocationErrorState extends LocationsState {
  final CatchException error;

  LocationErrorState({required this.error});
}

class ResidentLoadedState extends LocationsState {
  final List<CharacterResult> residentModel;

  ResidentLoadedState({required this.residentModel});
}

