import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rick_and_morty/features/characters/presentation/screens/character_list/widgets/grid_view_card.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/character_list/widgets/list_view_card.dart';

import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/character_shimmer_screen.dart';

import '../../logic/bloc/character_bloc.dart';
import '../../widgets/search_card.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({
    super.key,
  });

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  late CharacterBloc bloc;
  late bool isListView;

  @override
  void initState() {
    bloc = getIt<CharacterBloc>();
    bloc.add(GetCharacterEvent());
    isListView = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 54.h),
            const TextFieldSearchCard(
              hintText: 'Найти персонажа',
            ),
            SizedBox(height: 24.h),
            BlocConsumer<CharacterBloc, CharacterState>(
              bloc: bloc,
              listener: (context, state) {},
              builder: (context, state) {
                if (state is CharacterLoadingState) {
                  return const CharacterShimmerScreen();
                }

                if (state is CharacterLoadedState) {
                  return
                      // CharacterShimmerScreen();

                      Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'ВСЕГО ПЕРСОНАЖЕЙ: ',
                              style: const TextStyle(
                                color: Color(0xff828282),
                              ),
                              children: [
                                TextSpan(
                                  text: state.characterModel.info!.count
                                      .toString(),
                                )
                              ],
                            ),
                          ),
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
                      SizedBox(
                          height: 567.h,
                          child: isListView
                              ? ListViewCard(
                                  characterModel: state.characterModel)
                              : GirdViewCard(
                                  characterModel: state.characterModel))
                    ],
                  );
                }
                return const Text(
                  '123',
                  style: TextStyle(color: Colors.black),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
