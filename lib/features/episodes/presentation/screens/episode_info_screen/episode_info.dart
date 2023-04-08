import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/character_list/character_info.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/utils.dart';

import '../../logic/bloc/episode_bloc.dart';

class EpisodeInfo extends StatefulWidget {
  final EpisodeResult episodeModel;

  const EpisodeInfo({
    super.key,
    required this.episodeModel,
  });

  @override
  State<EpisodeInfo> createState() => _EpisodeInfoState();
}

class _EpisodeInfoState extends State<EpisodeInfo> {
  late EpisodeBloc bloc;

  @override
  void initState() {
    bloc = getIt<EpisodeBloc>();
    bloc.add(GetCharacterEvent(episodeModel: widget.episodeModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/episodeImage.png',
                height: 298.h,
                width: 1.sw,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top: 251.h),
                width: 1.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 82.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.episodeModel.name.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Серия ${widget.episodeModel.id}',
                        style: const TextStyle(
                          color: Color(0xff22A2BD),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Премьера',
                        style: TextStyle(
                          color: const Color(0xff828282),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        widget.episodeModel.airDate.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 36.h),
                    const Divider(),
                    SizedBox(height: 36.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Пеосонажи',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    BlocConsumer<EpisodeBloc, EpisodeState>(
                      bloc: bloc,
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return const CircularProgressIndicator();
                        }
                        if (state is CharacterLoadedState) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CharacterInfo(
                                          characterModel:
                                              state.characterModel[index],
                                        ),
                                      ));
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 74.r,
                                      width: 74.r,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        child: Image.network(
                                          state.characterModel[index].image
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getStatus(state
                                              .characterModel[index].status),
                                          style: TextStyle(
                                            color: colorStatus(state
                                                .characterModel[index].status),
                                          ),
                                        ),
                                        Text(
                                          state.characterModel[index].name
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${getGender(state.characterModel[index].gender)}, ',
                                              style: const TextStyle(
                                                color: Color(0xff828282),
                                              ),
                                            ),
                                            Text(
                                              getSpecies(state
                                                  .characterModel[index]
                                                  .species),
                                              style: const TextStyle(
                                                color: Color(0xff828282),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15.r,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 24.h),
                            itemCount: state.characterModel.length,
                          );
                        }

                        return const SizedBox();
                      },
                    )
                  ],
                ),
              ),
              Positioned(
                top: 201.h,
                left: 139.w,
                child: Container(
                  height: 99.r,
                  width: 99.r,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          offset: const Offset(0, 5)),
                    ],
                    color: const Color(0xff22A2BD),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
