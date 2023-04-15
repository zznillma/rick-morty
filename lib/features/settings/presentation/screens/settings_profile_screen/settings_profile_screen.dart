import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';

import '../../logic/bloc/profile_bloc.dart';

class SettingsProfile extends StatefulWidget {
  const SettingsProfile({super.key});

  @override
  State<SettingsProfile> createState() => _SettingsProfileState();
}

class _SettingsProfileState extends State<SettingsProfile> {
  late ProfileBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    bloc = getIt<ProfileBloc>();
    bloc.add(GetProfileEvent());
    super.initState();
  }

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Редактировать профиль',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProfileLoadedState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 21.h),
                  Center(
                    child: SizedBox(
                      height: 150.r,
                      width: 150.r,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200.r),
                        child: image == null
                            ? Image.asset(
                                state.profileModel.image,
                                fit: BoxFit.cover,
                              )
                            : Image.file(image!, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        await pickImage();
                      },
                      child: Text(
                        'Изменить фото',
                        style: TextStyle(
                          color: Color(0xff22A2BD),
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'ПРОФИЛЬ',
                    style: TextStyle(
                      color: Color(0xff828282),
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Изменить ФИО',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            '${state.profileModel.name} ${state.profileModel.surname} ${state.profileModel.patronymic ?? ''}',
                            style: TextStyle(
                              color: Color(0xff828282),
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15.r,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'О себе',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            state.profileModel.selfInfo.toString(),
                            style: TextStyle(
                              color: Color(0xff828282),
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15.r,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Логин',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            state.profileModel.login,
                            style: TextStyle(
                              color: Color(0xff828282),
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15.r,
                      ),
                    ],
                  )
                ],
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
