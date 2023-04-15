import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';
import 'package:rick_and_morty/features/locations/presentation/screens/location_info_screen/locations_info_screen.dart';
import 'package:rick_and_morty/features/locations/presentation/widgets/all_locations_card.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/location_shimmer_screen.dart';

import '../../../../characters/data/models/characters_model.dart';
import '../../logic/locations_bloc.dart';
import '../../../../characters/presentation/widgets/search_card.dart';

class LocationsScreen extends StatefulWidget {
  final CharacterModel? characterModel;

  const LocationsScreen({
    super.key,
    this.characterModel,
  });

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  late LocationsBloc bloc;
  late ScrollController scrollController;
  bool isLoading = false;
  List<Result> locationResultList = [];
  int counter = 1;
  int totalCount = 0;

  @override
  void initState() {
    bloc = getIt<LocationsBloc>();
    bloc.add(GetLocationsEvent(
      isFirstCall: true,
      page: counter,
    ));

    scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);

    super.initState();
  }

  _scrollListener() {
    if (locationResultList.isNotEmpty) {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        isLoading = true;

        if (isLoading) {
          counter = counter + 1;

          bloc.add(GetLocationsEvent(
            page: counter,
            isFirstCall: false,
          ));
        }
      }
    }
  }

  @override
  void dispose() {
    bloc.close();
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 54.h),
            const TextFieldSearchCard(
              hintText: 'Найти локацию',
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                const Text(
                  'ВСЕГО ЛОКАЦИЙ: ',
                  style: TextStyle(
                    color: Color(0xff828282),
                  ),
                ),
                BlocBuilder<LocationsBloc, LocationsState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is LocationLoadedState) {
                      return Text(
                        state.locationsModel.info!.count.toString(),
                        style: const TextStyle(
                          color: Color(0xff828282),
                        ),
                      );
                    }
                    return SizedBox();
                  },
                )
              ],
            ),
            BlocConsumer<LocationsBloc, LocationsState>(
              bloc: bloc,
              listener: (context, state) {
                if (state is LocationLoadedState) {
                  totalCount = state.locationsModel.info?.count ?? 0;

                  locationResultList.addAll(state.locationsModel.results ?? []);

                  isLoading = false;
                }
              },
              builder: (context, state) {
                if (state is LocationLoadingState) {
                  return const LocationShimmerCard();
                }

                if (state is LocationLoadedState) {
                  return Column(
                    children: [
                      SizedBox(height: 24.h),
                      SizedBox(
                        height: 576,
                        child: RefreshIndicator(
                          onRefresh: () async {
                            locationResultList.clear();

                            bloc.add(GetLocationsEvent(
                              isFirstCall: true,
                              page: 1,
                            ));
                          },
                          child: AllLocationsCard(
                            locationResultList: locationResultList,
                            scrollController: scrollController,
                            totalCount: totalCount,
                          ),
                        ),
                      )
                    ],
                  );
                }

                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
