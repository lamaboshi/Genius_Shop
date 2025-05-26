import 'package:genius_shop/Pages/favorites/controller/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoritesController());
  }
}
