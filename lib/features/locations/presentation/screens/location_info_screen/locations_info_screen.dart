import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/resident_shimmer_screen.dart';
import 'package:rick_and_morty/internal/helpers/utils.dart';

import '../../../../characters/data/models/characters_model.dart';
import '../../../data/models/locations_model.dart';
import '../../logic/locations_bloc.dart';
import '../../../../characters/presentation/screens/character_info_screen/character_info.dart';

class Locationsinfo extends StatefulWidget {
  final CharacterModel characterModel;

  final Result locationsModel;

  const Locationsinfo({
    super.key,
    required this.locationsModel,
    required this.characterModel,
  });

  @override
  State<Locationsinfo> createState() => _LocationsinfoState();
}

class _LocationsinfoState extends State<Locationsinfo> {
  late LocationsBloc bloc;

  @override
  void initState() {
    bloc = getIt<LocationsBloc>();
    bloc.add(GetResidentEvent(locationsModel: widget.locationsModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 296.h,
            child: Stack(
              children: [
                SizedBox(
                  height: 296.h,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/imageRick.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 61.h,
                  left: 20.w,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36.h),
                Text(
                  widget.locationsModel.name.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${widget.locationsModel.type.toString()} • ',
                      style: TextStyle(
                        color: const Color(0xff828282),
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      widget.locationsModel.dimension.toString(),
                      style: TextStyle(
                        color: const Color(0xff828282),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 36.h),
                Text(
                  'Пресонажи',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 24.h),
                BlocBuilder<LocationsBloc, LocationsState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is LocationLoadingState) {
                      return const ResidentShimmerCard();
                    }

                    if (state is ResidentLoadedState) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: widget.locationsModel.residents!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CharacterInfo(
                                      characterModel:
                                          state.residentModel[index],
                                    ),
                                  ));
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 74.r,
                                  width: 74.r,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.r),
                                    child: Image.network(state
                                        .residentModel[index].image
                                        .toString()),
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      getStatus(
                                        state.residentModel[index].status,
                                      ),
                                      style: TextStyle(
                                        color: colorStatus(
                                          state.residentModel[index].status,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      state.residentModel[index].name
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          getSpecies(
                                            state.residentModel[index].species,
                                          ),
                                          style: const TextStyle(
                                            color: Color(0xff828282),
                                          ),
                                        ),
                                        Text(
                                          ', ${getGender(
                                            state.residentModel[index].gender,
                                          )}',
                                          style: const TextStyle(
                                            color: Color(0xff828282),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15.r,
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 24.h),
                      );
                    }

                    return const SizedBox();
                  },
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
