import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoPlayCard extends StatelessWidget {
  const VideoPlayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 201.h,
      left: 139.w,
      child: Container(
        height: 99.r,
        width: 99.r,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                offset: const Offset(0, 5)),
          ],
          color: const Color(0xff22A2BD),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: const Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
