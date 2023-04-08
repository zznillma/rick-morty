import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';

import '../../../../../../internal/helpers/utils.dart';
import '../../../../data/models/characters_model.dart';
import '../character_info.dart';

class GirdViewCard extends StatelessWidget {
  final CharacterModel characterModel;

  const GirdViewCard({
    super.key,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 24.h),
      itemCount: int.parse(characterModel.results!.length.toString()),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.w,
        mainAxisSpacing: 50.h,
        // childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CharacterInfo(
                  characterModel: characterModel.results![index],
                ),
              ),
            );
          },
          child: Column(
            children: [
              SizedBox(
                height: 109.r,
                width: 109.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.network(
                    characterModel.results![index].image.toString(),
                  ),
                ),
              ),
              SizedBox(height: 11.h),
              Text(
                getStatus(
                  characterModel.results![index].status!.index
                      .toString()
                      .toUpperCase(),
                ),
                style: TextStyle(
                  fontSize: 16.sp,
                  color: colorStatus(
                    characterModel.results![index].status!.index.toString(),
                  ),
                ),
              ),
              Text(
                characterModel.results![index].name.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '${getSpecies(
                    characterModel.results![index].species!.index.toString(),
                  )}, ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff828282),
                  ),
                  children: [
                    TextSpan(
                      text: getGender(
                        characterModel.results![index].gender!.index.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
