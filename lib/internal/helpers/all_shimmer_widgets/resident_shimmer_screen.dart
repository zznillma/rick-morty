import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/custom_shimmer_widget.dart';

class ResidentShimmerCard extends StatelessWidget {
  const ResidentShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                height: 74.r,
                width: 74.r,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 10.h,
                    width: 43.w,
                    color: Colors.red,
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    height: 14.h,
                    width: 100.w,
                    color: Colors.red,
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    height: 10.h,
                    width: 120.w,
                    color: Colors.red,
                  )
                ],
              ),
              const Spacer(),
              InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 24.h),
      ),
    );
  }
}
