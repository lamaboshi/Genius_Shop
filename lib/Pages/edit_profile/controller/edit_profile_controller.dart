import 'package:genius_shop/domain/model/user.dart';
import 'package:genius_shop/domain/repository/auth_repo.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final repoAuth = AuthRepository();
  final user = User().obs;
  final isLoading = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    final data = repoAuth.getUserData();
    user.value = data!;
  }
}
