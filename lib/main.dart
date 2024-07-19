import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_with_getx/view/splash/splash_screen.dart';
import 'view/home/bottomnavigationbar_screen.dart';

void main() {
  runApp(const TODOApp());
}

class TODOApp extends StatelessWidget {
  const TODOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

