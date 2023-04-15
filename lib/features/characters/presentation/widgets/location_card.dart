import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationCard extends StatelessWidget {
  final String title;
  final String origin;

  const LocationCard({
    super.key,
    required this.origin,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xff828282),
                  fontSize: 12.sp,
                ),
              ),
              Text(
                origin,
                style: const TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 14.sp,
          )
        ],
      ),
    );
  }
}
