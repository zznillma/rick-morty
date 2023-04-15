import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/character_info_screen/character_info.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty/features/episodes/presentation/widgets/episode_characters_card.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/character_shimmer_screen.dart';
import 'package:rick_and_morty/internal/helpers/utils.dart';

import '../../logic/bloc/episode_bloc.dart';
import '../../widgets/video_play_card.dart';

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
                          return CharacterShimmerScreen();
                        }
                        if (state is CharacterLoadedState) {
                          return EpisodeCharacterCard(
                            characterModel: state.characterModel,
                          );
                        }

                        return const SizedBox();
                      },
                    )
                  ],
                ),
              ),
              const VideoPlayCard(),
            ],
          ),
        ],
      ),
    );
  }
}
