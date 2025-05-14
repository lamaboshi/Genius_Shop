import 'package:flutter/material.dart';
import 'package:genius_shop/app_router.dart';
import 'package:genius_shop/core/api/storage_service.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final storage = Get.find<StorageService>();
    return storage.isAuth ? null : RouteSettings(name: AppRouter.logIn);
  }
}
