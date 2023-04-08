import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/settings/data/models/profile_model.dart';
import 'package:rick_and_morty/features/settings/domain/use_cases/profile_use_cases.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception_helper.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCases useCases;

  ProfileBloc(this.useCases) : super(ProfileInitial()) {
    on<GetProfileEvent>((event, emit) async {
      emit(ProfileLoadingState());

      await useCases
          .getProfile()
          .then((profileModel) =>
              emit(ProfileLoadedState(profileModel: profileModel)))
          .onError((error, stackTrace) => emit(ProfileErrorState(
              error: CatchException.convertException(error))));
    });
  }
}
