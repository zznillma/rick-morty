import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/locations/presentation/screens/locations_screen/locations_info_screen.dart';
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

  @override
  void initState() {
    bloc = getIt<LocationsBloc>();
    bloc.add(GetLocationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 54.h),
            TextFieldSearchCard(
              hintText: 'Найти локацию',
            ),
            SizedBox(height: 24.h),
            BlocConsumer<LocationsBloc, LocationsState>(
              bloc: bloc,
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LocationLoadingState) {
                  return LocationShimmerCard();
                }

                if (state is LocationLoadedState) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'ВСЕГО ЛОКАЦИЙ: ',
                            style: TextStyle(
                              color: Color(0xff828282),
                            ),
                          ),
                          Text(
                            state.locationsModel.info!.count.toString(),
                            style: TextStyle(
                              color: Color(0xff828282),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        height: 576,
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: state.locationsModel.results!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Locationsinfo(
                                      characterModel: CharacterModel(),
                                      locationsModel:
                                          state.locationsModel.results![index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 218,
                                width: 343,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffE0E0E0),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 150.h,
                                      width: 343.w,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/imageRick.jpeg'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          topRight: Radius.circular(20.r),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.r),
                                      child: Text(
                                        state
                                            .locationsModel.results![index].name
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.r),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${state.locationsModel.results![index].type.toString()} • ',
                                            style: TextStyle(
                                              color: Color(0xff828282),
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            state.locationsModel.results![index]
                                                .dimension
                                                .toString(),
                                            style: TextStyle(
                                              color: Color(0xff828282),
                                              fontSize: 12.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 24.h),
                        ),
                      )
                    ],
                  );
                }

                return SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
