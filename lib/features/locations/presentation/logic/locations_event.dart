// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'locations_bloc.dart';

@immutable
abstract class LocationsEvent {}

class GetLocationsEvent extends LocationsEvent {
  final bool isFirstCall;
  final int page;

  GetLocationsEvent({
    this.isFirstCall = false,
    required this.page,
  });
}

class GetResidentEvent extends LocationsEvent {
  final Result locationsModel;

  GetResidentEvent({required this.locationsModel});
}
