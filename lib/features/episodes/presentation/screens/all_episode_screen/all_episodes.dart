import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/search_card.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty/features/episodes/presentation/widgets/all_episodes_screen_card.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';

import '../../logic/bloc/episode_bloc.dart';

class AllEpisodes extends StatefulWidget {
  const AllEpisodes({super.key});

  @override
  State<AllEpisodes> createState() => _AllEpisodesState();
}

class _AllEpisodesState extends State<AllEpisodes> {
  late EpisodeBloc bloc;
  late ScrollController scrollController;
  bool isLoading = false;
  List<EpisodeResult> episodeResultList = [];
  int counter = 1;
  int totalCount = 0;
  int totalPage = 2;

  @override
  void initState() {
    bloc = getIt<EpisodeBloc>();
    bloc.add(GetEpisodeEvent(
      isFirstCall: true,
      page: counter,
    ));

    scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);

    super.initState();
  }

  _scrollListener() {
    if (episodeResultList.isNotEmpty) {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        isLoading = true;

        if (isLoading && counter < totalPage) {
          counter = counter + 1;

          bloc.add(GetEpisodeEvent(
            isFirstCall: false,
            page: counter,
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
      resizeToAvoidBottomInset: true,
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
                listener: (context, state) {
                  if (state is EpisodeLoadedState) {
                    totalPage = state.episodeModel.info?.pages ?? 0;
                    totalCount = state.episodeModel.info?.count ?? 0;

                    episodeResultList.addAll(state.episodeModel.results ?? []);

                    isLoading = false;
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const CircularProgressIndicator();
                  }

                  if (state is EpisodeLoadedState) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        episodeResultList.clear();

                        bloc.add(GetEpisodeEvent(
                          isFirstCall: true,
                          page: 1,
                        ));
                      },
                      child: AllEpisodeCard(
                        scrollController: scrollController,
                        episodeResultList: episodeResultList,
                        totalCount: totalCount,
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
