import 'package:assignmentredscope/Controller/BookMarkController.dart';
import 'package:assignmentredscope/Screens/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Services/SharedPreferencesService.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.initializePreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookMarkController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(appBarTheme: AppBarTheme(centerTitle: true),),
      theme: ThemeData(
        appBarTheme: AppBarTheme(centerTitle: true),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}