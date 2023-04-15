import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/grid_view_card.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/list_view_card.dart';

class AllCharactersCard extends StatefulWidget {
  final bool isListView;
  final int totalCount;
  final List<CharacterResult> characterResultList;
  final ScrollController scrollController;

  const AllCharactersCard({
    super.key,
    required this.totalCount,
    required this.characterResultList,
    required this.scrollController,
    required this.isListView,
  });

  @override
  State<AllCharactersCard> createState() => _AllCharactersCardState();
}

class _AllCharactersCardState extends State<AllCharactersCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 567.h,
          child: widget.isListView
              ? ListViewCard(
                  characterResultList: widget.characterResultList,
                  scrollController: widget.scrollController,
                )
              : GirdViewCard(
                  characterResultList: widget.characterResultList,
                  scrollController: widget.scrollController,
                ),
        )
      ],
    );
  }
}
