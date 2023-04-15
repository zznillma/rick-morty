import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'internal/helpers/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018
                .apply(fontSizeFactor: 1.sp, bodyColor: Colors.black),
          ),
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
