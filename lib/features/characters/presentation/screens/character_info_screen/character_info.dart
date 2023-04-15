import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_info_card.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/episode_shimmer_screen.dart';
import 'package:rick_and_morty/internal/helpers/utils.dart';
import '../../../../locations/data/models/locations_model.dart';
import '../../../data/models/characters_model.dart';
import '../../logic/bloc/character_bloc.dart';
import '../../widgets/character_episode_card.dart';
import '../../widgets/character_image_card.dart';

class CharacterInfo extends StatefulWidget {
  final CharacterResult characterModel;
  final Result? locationsModel;

  const CharacterInfo({
    super.key,
    required this.characterModel,
    this.locationsModel,
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
          CharacterImageCard(
            characterModel: widget.characterModel,
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
          CharacterInfoCard(
            characterModel: widget.characterModel,
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
                return CharacterEpisodeCard(
                  characterEpisodeModel: state.characterEpisodeModel,
                  characterModel: widget.characterModel,
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
