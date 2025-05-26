import 'package:flutter/material.dart';
import 'package:genius_shop/domain/repository/auth_repo.dart';
import 'package:get/get.dart';

import '../../../app_router.dart';
import '../../../domain/model/user.dart';
import '../../../ui/overlay/custom_snackbar.dart';

class LogInController extends GetxController {
  final user = User().obs;
  final isLoading = false.obs;
  final rememberMe = true.obs;

  Future<void> logIn(BuildContext context) async {
    isLoading.value = true;
    final result = await AuthRepository().login(
      user.value.userName!,
      user.value.password!,
    );
    isLoading.value = false;
    if (result == null || !result) {
      showCustomSnackbar(
        context,
        isError: true,
        message: 'something want wrong',
      );
      return;
    }
    Get.rootDelegate.offAndToNamed(AppRouter.home);
  }
}
