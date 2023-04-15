import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/custom_shimmer_widget.dart';

class ListViewCardShimmer extends StatelessWidget {
  const ListViewCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Row(
              children: [
                SizedBox(
                  height: 74.r,
                  width: 74.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(600).r,
                    child: Container(color: Colors.red),
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 100,
                      color: Colors.red,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: 150,
                      color: Colors.red,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: 50,
                      color: Colors.red,
                    )
                    // Text(
                    //   getStatus(
                    //     characterModel.results![index].status!.index.toString(),
                    //   ),
                    //   style: TextStyle(
                    //     color: colorStatus(
                    //       characterModel.results![index].status!.index.toString(),
                    //     ),
                    //   ),
                    // ),
                    // Text(
                    //   characterModel.results![index].name.toString(),
                    //   style: const TextStyle(color: Colors.black),
                    // ),
                    // RichText(
                    //   text: TextSpan(
                    //     text: '${getSpecies(
                    //       characterModel.results![index].species!.index
                    //           .toString(),
                    //     )}, ',
                    //     style: const TextStyle(
                    //       color: Color(0xff828282),
                    //     ),
                    //     children: [
                    //       TextSpan(
                    //         text: getGender(
                    //           characterModel.results![index].gender!.index
                    //               .toString(),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 24.h),
      ),
    );
  }
}
