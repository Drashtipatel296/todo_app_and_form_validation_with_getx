import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;

  void checkEmail(String value) {
    if (value.isEmpty) {
      emailError.value = 'Email cannot be empty';
    } else if (!GetUtils.isEmail(value)) {
      emailError.value = 'Enter a valid email';
    } else {
      emailError.value = '';
    }
  }

  void checkPassword(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    } else if (value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters long';
    } else {
      passwordError.value = '';
    }
  }

  void login() {
    checkEmail(email.value);
    checkPassword(password.value);

    if (emailError.isEmpty && passwordError.isEmpty) {
      Get.snackbar(
        'Success',
        'Logged in successfully',
        margin: const EdgeInsets.all(8),
        animationDuration: const Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Please fix the errors',
        margin: const EdgeInsets.all(8),
        animationDuration: const Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
