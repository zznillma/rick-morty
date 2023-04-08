
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../../../../internal/helpers/utils.dart';
import '../../../../data/models/characters_model.dart';
import '../character_info.dart';

class ListViewCard extends StatelessWidget {
  final CharacterModel characterModel;

  const ListViewCard({
    super.key,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 24.h),
      itemCount: characterModel.results!.length,
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
          child: Row(
            children: [
              SizedBox(
                height: 74.r,
                width: 74.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(600).r,
                  child: Image.network(
                    characterModel.results![index].image.toString(),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getStatus(
                      characterModel.results![index].status!,
                    ),
                    style: TextStyle(
                      color: colorStatus(
                        characterModel.results![index].status!,
                      ),
                    ),
                  ),
                  Text(
                    characterModel.results![index].name.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '${getSpecies(
                        characterModel.results![index].species,
                      )}, ',
                      style: const TextStyle(
                        color: Color(0xff828282),
                      ),
                      children: [
                        TextSpan(
                          text: getGender(
                            characterModel.results![index].gender,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
    );
  }
}
