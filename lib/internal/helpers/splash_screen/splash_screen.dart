import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/helpers/bottom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const BottomNavBar()),
          (Route<dynamic> route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/startScreen.png',
            scale: 0.5.sp,
          ),
          Image.asset('assets/images/image1.png'),
          Positioned(
            bottom: 1.sp,
            right: 20.sp,
            left: 20.sp,
            child: Image.asset('assets/images/image2.png'),
          ),
        ],
      ),
    );
  }
}
