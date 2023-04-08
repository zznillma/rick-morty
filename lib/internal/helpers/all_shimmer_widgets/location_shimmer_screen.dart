import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/custom_shimmer_widget.dart';

class LocationShimmerCard extends StatelessWidget {
  const LocationShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'ВСЕГО ЛОКАЦИЙ: ',
                style: TextStyle(
                  color: Color(0xff828282),
                ),
              ),
              Container(
                height: 15,
                width: 22,
                color: Colors.amber,
              ),
            ],
          ),
          SizedBox(height: 24.h),
          SizedBox(
            height: 576,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  height: 218,
                  width: 343,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      width: 1,
                      color: Color(0xffE0E0E0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150.h,
                        width: 343.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/imageRick.jpeg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Padding(
                          padding: EdgeInsets.only(left: 16.r),
                          child: Container(
                            height: 20,
                            width: 121,
                            color: Colors.red,
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 16.r),
                        child: Row(
                          children: [
                            Container(
                              height: 10,
                              width: 30,
                              color: Colors.red,
                            ),
                            Text(
                              '•',
                              style: TextStyle(
                                color: Color(0xff828282),
                                fontSize: 12.sp,
                              ),
                            ),
                            Container(
                              height: 10,
                              width: 105,
                              color: Colors.red,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 24.h),
            ),
          )
        ],
      ),
    );
  }
}
