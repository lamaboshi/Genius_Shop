import 'package:flutter/material.dart';
import 'package:genius_shop/app_router.dart';
import 'package:genius_shop/domain/model/user.dart';
import 'package:genius_shop/domain/repository/auth_repo.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final authService = AuthRepository();
  final user = User().obs;
  final password = ''.obs;
  final isAgree = false.obs;
  final isLoading = false.obs;

  Future<void> singUp() async {
    if (!isAgree()) return;

    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    final result = await authService.signup(user.value);
    if (result) {
      Get.rootDelegate.toNamed(AppRouter.home);
    }
    isLoading.value = false;
  }
}
