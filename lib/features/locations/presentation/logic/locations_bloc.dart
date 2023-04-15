import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../internal/helpers/catch_exception_helper.dart';
import '../../../characters/data/models/characters_model.dart';
import '../../data/models/locations_model.dart';
import '../../domain/use_cases/location_use_cases.dart';

part 'locations_event.dart';
part 'locations_state.dart';

@injectable
class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  final LocationUseCases useCases;

  LocationsBloc(this.useCases) : super(LocationsInitial()) {
    on<LocationsEvent>((event, emit) {});

    on<GetLocationsEvent>((event, emit) async {
      if (event.isFirstCall) {
        emit(LocationLoadingState());
      }

      await useCases
          .getLocations(event.page)
          .then((locationsModel) =>
              emit(LocationLoadedState(locationsModel: locationsModel)))
          .onError((error, stackTrace) => emit(LocationErrorState(
              error: CatchException.convertException(error))));
    });

    on<GetResidentEvent>((event, emit) async {
      emit(LocationLoadingState());

      await useCases
          .getResident(event.locationsModel)
          .then((residentModel) =>
              emit(ResidentLoadedState(residentModel: residentModel)))
          .onError((error, stackTrace) => emit(LocationErrorState(
              error: CatchException.convertException(error))));
    });
  }
}
