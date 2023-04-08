import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/search_card.dart';
import 'package:rick_and_morty/features/episodes/presentation/screens/episode_info_screen/episode_info.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';

import '../../logic/bloc/episode_bloc.dart';

class AllEpisodes extends StatefulWidget {
  const AllEpisodes({super.key});

  @override
  State<AllEpisodes> createState() => _AllEpisodesState();
}

class _AllEpisodesState extends State<AllEpisodes> {
  late EpisodeBloc bloc;

  @override
  void initState() {
    bloc = getIt<EpisodeBloc>();
    bloc.add(GetEpisodeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            children: [
              SizedBox(height: 54.h),
              const TextFieldSearchCard(hintText: 'Найти эпизод'),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text(
                    'ЭПИЗОДЫ: ',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff828282),
                    ),
                  ),
                  BlocBuilder<EpisodeBloc, EpisodeState>(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is EpisodeLoadedState) {
                        return Text(
                          state.episodeModel.info!.count.toString(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff828282),
                          ),
                        );
                      }
                      return const Text('123');
                    },
                  ),
                ],
              ),
              SizedBox(height: 26.h),
              BlocConsumer<EpisodeBloc, EpisodeState>(
                bloc: bloc,
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is EpisodeLoadedState) {
                    return SizedBox(
                      height: 543.h,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: state.episodeModel.results!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EpisodeInfo(
                                          episodeModel: state
                                              .episodeModel.results![index])));
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 60.r,
                                  width: 60.r,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(
                                        'assets/images/episodeImage.png'),
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Серия ',
                                          style: TextStyle(
                                            color: Color(0xff22A2BD),
                                          ),
                                        ),
                                        Text(
                                          state.episodeModel.results![index].id
                                              .toString(),
                                          style: const TextStyle(
                                            color: Color(0xff22A2BD),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 2.h),
                                    SizedBox(
                                      width: 259.w,
                                      child: Text(
                                        state.episodeModel.results![index].name
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      state.episodeModel.results![index].airDate
                                          .toString(),
                                      style: const TextStyle(
                                          color: Color(0xff828282)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 24.h),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
