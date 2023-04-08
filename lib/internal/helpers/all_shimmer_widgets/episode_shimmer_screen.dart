import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/custom_shimmer_widget.dart';

class EpisodeShimmerCard extends StatelessWidget {
  const EpisodeShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(
          left: 17.w,
          right: 25.w,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Row(
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
                  Container(
                    height: 20,
                    width: 50,
                    color: Colors.black,
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    height: 20,
                    width: 180,
                    color: Colors.black,
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    height: 20.h,
                    width: 104.w,
                    color: Colors.black,
                  )
                ],
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.sp,
              )
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 24.h),
      ),
    );
  }
}
