import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:genius_shop/app_router.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Dio());
    return GetMaterialApp.router(
      title: "Genius Shop",
      debugShowCheckedModeBanner: false,
      enableLog: true,
      defaultTransition: Transition.fade,
      getPages: AppRouter.routes,
    );
  }
}
