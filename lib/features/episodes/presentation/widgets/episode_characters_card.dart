import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/utils.dart';
import '../../../characters/data/models/characters_model.dart';
import '../../../characters/presentation/screens/character_info_screen/character_info.dart';

class EpisodeCharacterCard extends StatelessWidget {
  final List<CharacterResult> characterModel;

  const EpisodeCharacterCard({
    super.key,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: characterModel.length,
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
                    characterModel: characterModel[index],
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
                  child: Image.network(
                    characterModel[index].image.toString(),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getStatus(characterModel[index].status),
                    style: TextStyle(
                      color: colorStatus(characterModel[index].status),
                    ),
                  ),
                  Text(
                    characterModel[index].name.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  Row(
                    children: [
                      Text(
                        '${getGender(characterModel[index].gender)}, ',
                        style: const TextStyle(
                          color: Color(0xff828282),
                        ),
                      ),
                      Text(
                        getSpecies(characterModel[index].species),
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
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
    );
  }
}
