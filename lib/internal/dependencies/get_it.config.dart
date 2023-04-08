// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/characters/data/repositories/character_repository_impl.dart'
    as _i4;
import '../../features/characters/domain/repositories/character_repository.dart'
    as _i3;
import '../../features/characters/domain/use_cases/character_use_cases.dart'
    as _i5;
import '../../features/characters/presentation/logic/bloc/character_bloc.dart'
    as _i14;
import '../../features/episodes/data/repositories/episode_repository_impl.dart'
    as _i7;
import '../../features/episodes/domain/repositories/episode_repository.dart'
    as _i6;
import '../../features/episodes/domain/use_cases/episode_use_cases.dart' as _i8;
import '../../features/episodes/presentation/logic/bloc/episode_bloc.dart'
    as _i15;
import '../../features/locations/data/repositories/location_repository_impl.dart'
    as _i10;
import '../../features/locations/domain/repositories/location_repositiry.dart'
    as _i9;
import '../../features/locations/domain/use_cases/location_use_cases.dart'
    as _i16;
import '../../features/locations/presentation/logic/locations_bloc.dart'
    as _i17;
import '../../features/settings/data/repositories/profile_repository_impl.dart'
    as _i12;
import '../../features/settings/domain/repositories/profile_repository.dart'
    as _i11;
import '../../features/settings/domain/use_cases/profile_use_cases.dart'
    as _i13;
import '../../features/settings/presentation/logic/bloc/profile_bloc.dart'
    as _i18;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.CharacterRepository>(() => _i4.CharacterRepositoryImpl());
  gh.factory<_i5.CharactherUseCases>(() => _i5.CharactherUseCases(
      characterRepository: gh<_i3.CharacterRepository>()));
  gh.factory<_i6.EpisodeRepository>(() => _i7.EpisodeRepositoryImpl());
  gh.factory<_i8.EpisodeUseCases>(() =>
      _i8.EpisodeUseCases(episodeRepository: gh<_i6.EpisodeRepository>()));
  gh.factory<_i9.LocationsRepository>(() => _i10.LocationsRepositoryImpl());
  gh.factory<_i11.ProfileRepository>(() => _i12.ProfileRepositoryImpl());
  gh.factory<_i13.ProfileUseCases>(() =>
      _i13.ProfileUseCases(profileRepository: gh<_i11.ProfileRepository>()));
  gh.factory<_i14.CharacterBloc>(
      () => _i14.CharacterBloc(gh<_i5.CharactherUseCases>()));
  gh.factory<_i15.EpisodeBloc>(
      () => _i15.EpisodeBloc(gh<_i8.EpisodeUseCases>()));
  gh.factory<_i16.LocationUseCases>(() => _i16.LocationUseCases(
      locationsRepository: gh<_i9.LocationsRepository>()));
  gh.factory<_i17.LocationsBloc>(
      () => _i17.LocationsBloc(gh<_i16.LocationUseCases>()));
  gh.factory<_i18.ProfileBloc>(
      () => _i18.ProfileBloc(gh<_i13.ProfileUseCases>()));
  return getIt;
}
