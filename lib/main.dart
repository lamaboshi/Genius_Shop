import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:genius_shop/app_router.dart';
import 'package:get/get.dart';

import 'core/api/storage_service.dart';

const BASE_Endpoint = 'https://mywebsite.wpgeniustuts.com';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = Get.put(StorageService());
    storage.init();
    Get.put(Dio());
    return GetMaterialApp.router(
      title: "Genius Shop",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      enableLog: true,
      defaultTransition: Transition.fade,
      getPages: AppRouter.routes,
    );
  }
}
