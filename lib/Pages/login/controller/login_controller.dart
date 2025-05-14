import 'package:genius_shop/domain/repository/auth_repo.dart';
import 'package:get/get.dart';

import '../../../app_router.dart';
import '../../../domain/model/user.dart';

class LogInController extends GetxController {
  final user = User().obs;
  final isLoading = false.obs;

  Future<void> logIn() async {
    isLoading.value = true;
    final result = await AuthRepository().login(
      user.value.email!,
      user.value.password!,
    );
    isLoading.value = false;
    if (result) {
      Get.rootDelegate.offAndToNamed(AppRouter.home);
    }
  }
}
