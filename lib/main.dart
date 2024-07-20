import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_with_getx/LOGIN%20FORM/screen/login_screen.dart';
import 'TODO APP/view/splash/splash_screen.dart';

void main() {
  runApp(const TODOApp());
}

class TODOApp extends StatelessWidget {
  const TODOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

