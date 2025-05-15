import 'package:genius_shop/domain/model/user.dart';
import 'package:genius_shop/domain/repository/auth_repo.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final repo = AuthRepository();
  final user = User().obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    final data = repo.getUserData();
    user.value = data!;
  }
}
