import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';

import '../../../episodes/data/models/episode_model.dart';
import '../../../episodes/presentation/screens/episode_info_screen/episode_info.dart';

class CharacterEpisodeCard extends StatelessWidget {
  final List<EpisodeResult> characterEpisodeModel;
  final CharacterResult characterModel;

  const CharacterEpisodeCard({
    super.key,
    required this.characterEpisodeModel,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(
        left: 17.w,
        right: 25.w,
      ),
      itemCount: characterModel.episode!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EpisodeInfo(
                          episodeModel: characterEpisodeModel[index],
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
                    'Серия ${characterEpisodeModel[index].id}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xff22A2BD),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: 220,
                    child: Text(
                      characterEpisodeModel[index].name.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    characterEpisodeModel[index].airDate.toString(),
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
}
