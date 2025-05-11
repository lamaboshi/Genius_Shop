import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthRepository {
  final _dio = Get.find<Dio>();

  final storeUrl = 'http://example.com';
  final endpoint = '/wc-auth/v1/authorize';

  Future<Uri> getAuth() async {
    const consumerKey = 'ck_422d009eb8b3deb718cc4cae77c4ef340424f4b8';
    const consumerSecret = 'cs_8c6437cef1ffbc926871621c9b9f6745258b581e';
    const url = 'https://mywebsite.wpgeniustuts.com/wp-json/wc/v3/customers';

    try {
      print(url);
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization':
                'Basic ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}',
          },
        ),
      );

      print('Response: ${response.data}');
    } catch (e) {
      print('Error: $e');
    }
    return Uri();
  }
}
