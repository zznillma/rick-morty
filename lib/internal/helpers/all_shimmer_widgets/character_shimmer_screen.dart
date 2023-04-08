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
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'ВСЕГО ПЕРСОНАЖЕЙ: ',
                style: const TextStyle(
                  color: Color(0xff828282),
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                height: 20,
                width: 20,
                color: Colors.blue,
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  isListView = !isListView;
                  setState(() {});
                },
                child: isListView
                    ? Image.asset(
                        'assets/images/listview.png',
                        height: 24.h,
                        width: 24.w,
                      )
                    : Image.asset(
                        'assets/images/gridview.png',
                        height: 24.h,
                        width: 24.w,
                      ),
              )
            ],
          ),
          SizedBox(height: 567.h, child: ListViewCardShimmer()
              // Container(
              //   height: 200,
              //   width: 200,
              //   color: Colors.black,
              // )

              //  isListView
              //     ?
              //     : ListViewCardShimmer()
              )
        ],
      ),
    );
  }
}
