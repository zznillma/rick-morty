import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';

import '../../../characters/data/models/characters_model.dart';
import '../screens/location_info_screen/locations_info_screen.dart';

class AllLocationsCard extends StatefulWidget {
  final List<Result> locationResultList;
  final ScrollController scrollController;
  final int totalCount;

  const AllLocationsCard(
      {super.key,
      required this.locationResultList,
      required this.scrollController,
      required this.totalCount});

  @override
  State<AllLocationsCard> createState() => _AllLocationsCardState();
}

class _AllLocationsCardState extends State<AllLocationsCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: widget.scrollController,
      padding: EdgeInsets.zero,
      itemCount: widget.locationResultList.length,
      itemBuilder: (context, index) {
        if (index >= widget.locationResultList.length - 1) {
          return Platform.isIOS
              ? CupertinoActivityIndicator(
                  radius: 15.r,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Locationsinfo(
                  characterModel: CharacterModel(),
                  locationsModel: widget.locationResultList[index],
                ),
              ),
            );
          },
          child: Container(
            height: 218.h,
            width: 343.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                width: 1,
                color: const Color(0xffE0E0E0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150.h,
                  width: 343.w,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
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
                  child: Text(
                    widget.locationResultList[index].name.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.r),
                  child: Row(
                    children: [
                      Text(
                        '${widget.locationResultList[index].type.toString()} • ',
                        style: TextStyle(
                          color: const Color(0xff828282),
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        widget.locationResultList[index].dimension.toString(),
                        style: TextStyle(
                          color: const Color(0xff828282),
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
    );
  }
}
