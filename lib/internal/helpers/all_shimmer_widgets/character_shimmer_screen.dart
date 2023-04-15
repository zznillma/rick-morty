import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/custom_shimmer_widget.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/listview_card_shimmer.dart';

class CharacterShimmerScreen extends StatefulWidget {
  const CharacterShimmerScreen({super.key});

  @override
  State<CharacterShimmerScreen> createState() => _CharacterShimmerScreenState();
}

class _CharacterShimmerScreenState extends State<CharacterShimmerScreen> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10.w),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 527.h,
              child: ListViewCardShimmer(),
            )
          ],
        ),
      ),
    );
  }
}
