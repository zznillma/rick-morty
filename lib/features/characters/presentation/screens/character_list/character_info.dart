import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:rick_and_morty/features/episodes/presentation/screens/episode_info_screen/episode_info.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/episode_shimmer_screen.dart';
import 'package:rick_and_morty/internal/helpers/utils.dart';

import '../../../data/models/characters_model.dart';
import '../../logic/bloc/character_bloc.dart';

class CharacterInfo extends StatefulWidget {
  final CharacterResult characterModel;

  const CharacterInfo({
    super.key,
    required this.characterModel,
  });

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  late CharacterBloc bloc;

  @override
  void initState() {
    bloc = getIt<CharacterBloc>();
    bloc.add(GetCharacterEpisodeEvent(characterModel: widget.characterModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 218.h,
                width: 383.w,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 3,
                    sigmaY: 3,
                  ),
                  child: Image.network(
                    widget.characterModel.image.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -69.h,
                left: 123.w,
                child: Container(
                  height: 146.r,
                  width: 146.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(
                      width: 8.w,
                      color: Colors.white,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      widget.characterModel.image.toString(),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 61.h,
                left: 24.w,
                child: InkWell(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 90.h),
          Center(
            child: Text(
              widget.characterModel.name.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 34.sp,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Center(
            child: Text(
              getStatus(
                widget.characterModel.status!,
              ),
              style: TextStyle(
                color: colorStatus(
                  widget.characterModel.status,
                ),
              ),
            ),
          ),
          SizedBox(height: 36.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ричард «Рик» Санчез (англ. Rick Sanchez) — главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'пол',
                            style: TextStyle(
                              color: const Color(0xff828282),
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            getGender(
                              widget.characterModel.gender,
                            ),
                            style: const TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Расса',
                            style: TextStyle(
                              color: const Color(0xff828282),
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            getSpecies(
                              widget.characterModel.species ?? '',
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Место рождения',
                          style: TextStyle(
                            color: const Color(0xff828282),
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          widget.characterModel.origin!.name.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                    )
                  ],
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Место положение',
                          style: TextStyle(
                            color: const Color(0xff828282),
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          widget.characterModel.location!.name.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 36.h),
          const Divider(
            color: Colors.grey,
            thickness: 0,
          ),
          SizedBox(height: 36.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  'Эпизоды',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  'Все эпизоды',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff828282),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          BlocBuilder<CharacterBloc, CharacterState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is CharacterLoadingState) {
                return const EpisodeShimmerCard();
              }

              if (state is EpisodeLoadedState) {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    left: 17.w,
                    right: 25.w,
                  ),
                  itemCount: widget.characterModel.episode!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EpisodeInfo(
                                      episodeModel:
                                          state.characterEpisodeModel[index],
                                    )));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 74.r,
                            width: 74.r,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                'https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/08/Rick--Morty-Season-6EWKSF-feature.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Серия ${state.characterEpisodeModel[index].id}',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xff22A2BD),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              SizedBox(
                                width: 220,
                                child: Text(
                                  state.characterEpisodeModel[index].name
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                state.characterEpisodeModel[index].airDate
                                    .toString(),
                                style: const TextStyle(
                                  color: Color(0xff6E798C),
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.sp,
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 24.h),
                );
              }

              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
