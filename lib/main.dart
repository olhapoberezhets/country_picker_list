import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tbr_group/screens.dart/home_screen.dart';
import 'package:tbr_group/services/app_provider.dart';
import 'package:tbr_group/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: activeColor,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const Scaffold(
              backgroundColor: appColor,
              body: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
