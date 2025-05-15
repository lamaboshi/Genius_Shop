import 'package:genius_shop/app_router.dart';
import 'package:genius_shop/domain/repository/auth_repo.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final email = ''.obs;
  final isLoading = false.obs;
  final repo = AuthRepository();
  Future<void> confirmEmail() async {
    final result = await repo.sendPasswordResetEmail(email.value);
    if (result) {
      Get.rootDelegate.toNamed(AppRouter.password);
    }
  }
}
