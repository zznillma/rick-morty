import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/settings/presentation/screens/settings_profile_screen/settings_profile_screen.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';

import '../../logic/bloc/profile_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late ProfileBloc bloc;
  late String version;
  late String code;
  @override
  void initState() {
    bloc = getIt<ProfileBloc>();
    bloc.add(GetProfileEvent());
    super.initState();
    helper();
  }

  helper() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    code = packageInfo.buildNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Настройки',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: bloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const CircularProgressIndicator();
          }

          if (state is ProfileLoadedState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 33.h),
                  Row(
                    children: [
                      SizedBox(
                        height: 80.r,
                        width: 80.r,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(
                            state.profileModel.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.profileModel.name} ${state.profileModel.surname} ${state.profileModel.patronymic ?? ''}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            state.profileModel.login,
                            style: const TextStyle(
                              color: Color(0xff828282),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsProfile(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      fixedSize: Size(350.w, 45.h),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(
                        width: 1,
                        color: Color(0xff22A2BD),
                      ),
                    ).copyWith(
                      elevation: const MaterialStatePropertyAll(0),
                    ),
                    child: const Text(
                      'Редактировать',
                      style: TextStyle(
                        color: Color(0xff22A2BD),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  const Divider(),
                  SizedBox(height: 36.h),
                  const Text(
                    'ВНЕШНИЙ ВИД',
                    style: TextStyle(
                      color: Color(0xff828282),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [],
                  ),
                  SizedBox(height: 36.h),
                  const Divider(),
                  SizedBox(height: 36.h),
                  const Text(
                    'О СЕБЕ',
                    style: TextStyle(
                      color: Color(0xff828282),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    state.profileModel.selfInfo ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 36.h),
                  const Text(
                    'ВЕРСИЯ ПРИЛОЖЕНИЯ',
                    style: TextStyle(
                      color: Color(0xff828282),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Rick & Morty  v$version',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
