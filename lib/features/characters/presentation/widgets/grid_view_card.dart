import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/utils.dart';
import '../../data/models/characters_model.dart';
import '../screens/character_info_screen/character_info.dart';

class GirdViewCard extends StatelessWidget {
  final List<CharacterResult> characterResultList;
  final ScrollController scrollController;

  const GirdViewCard({
    super.key,
    required this.characterResultList,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: EdgeInsets.only(top: 24.h),
      itemCount: int.parse(characterResultList.length.toString()),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.w,
        mainAxisSpacing: 50.h,
      ),
      itemBuilder: (context, index) {
        if (index >= characterResultList.length - 1) {
          return Platform.isIOS
              ? CupertinoActivityIndicator(radius: 15.r)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CharacterInfo(
                  characterModel: characterResultList[index],
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
                    characterResultList[index].image.toString(),
                  ),
                ),
              ),
              SizedBox(height: 11.h),
              Text(
                getStatus(characterResultList[index].status),
                style: TextStyle(
                  fontSize: 16.sp,
                  color: colorStatus(
                    characterResultList[index].status,
                  ),
                ),
              ),
              Text(
                characterResultList[index].name.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '${getSpecies(
                    characterResultList[index].species,
                  )}, ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff828282),
                  ),
                  children: [
                    TextSpan(
                      text: getGender(
                        characterResultList[index].gender,
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
