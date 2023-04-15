import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/location_card.dart';

import '../../../../internal/helpers/utils.dart';

class CharacterInfoCard extends StatelessWidget {
  final CharacterResult characterModel;

  const CharacterInfoCard({
    super.key,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        characterModel.gender,
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
                      getSpecies(characterModel.species),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),
          LocationCard(
            origin: characterModel.origin!.name.toString(),
            title: 'Место рождения',
          ),
          SizedBox(height: 24.h),
          LocationCard(
            origin: characterModel.location!.name.toString(),
            title: 'Местоположение',
          ),
        ],
      ),
    );
  }
}
