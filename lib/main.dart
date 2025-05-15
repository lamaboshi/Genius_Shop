import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:genius_shop/app_router.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:overlayment/overlayment.dart';

import 'core/api/storage_service.dart';

const BASE_Endpoint = 'https://mywebsite.wpgeniustuts.com';

void main() {
  runApp(const MyApp());
}

final logger = Logger(filter: null, printer: PrettyPrinter(), output: null);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<NavigatorState>();
    Overlayment.navigationKey = key;
    final storage = Get.put(StorageService());
    storage.init();

    Get.put(Dio());
    return GetMaterialApp.router(
      title: "Genius Shop",
      key: key,
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
