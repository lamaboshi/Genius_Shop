import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:genius_shop/core/api/storage_service.dart';
import 'package:genius_shop/domain/model/user.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../interfaces/auth_interface.dart';

class AuthRepository extends IAuthRepository {
  final _dio = Get.find<Dio>();

  final _storage = Get.find<StorageService>();

  @override
  Future<bool> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '$BASE_Endpoint/wp-json/jwt-auth/v1/token',
        data: {'username': username, 'password': password},
      );

      _storage.saveData(StorageService.authToken, response.data['token']);
      await getCurrentUser();
      return true;
    } on DioException catch (e) {
      print('Login failed: ${e.response?.data}');
      return false;
    }
  }

  @override
  Future<void> getCurrentUser() async {
    final token = _storage.getData(StorageService.authToken);
    print('the Token : $token');
    try {
      final response = await _dio.get(
        '$BASE_Endpoint/wp-json/wp/v2/users/me',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        _storage.saveData(StorageService.userData, jsonEncode(response.data));
      }
    } on DioException catch (e) {
      print('Login failed: ${e.response?.data}');
    }
  }

  @override
  User? getUserData() {
    var data =
        jsonDecode(_storage.getData(StorageService.userData)!) as dynamic;
    print(data);
    if (data != null) {
      final d = User.fromMap(data);
      print(d);
      return d;
    }
    return null;
  }

  @override
  Future<bool> signup(User user) async {
    final data = user.toMap();
    data['roles'] = ['contributor'];
    print(data);
    try {
      final result = await _dio.post(
        '$BASE_Endpoint/wp-json/jwt-auth/v1/token',
        data: {'username': user.name, 'password': user.password},
      );
      final token = result.data['token'];
      final response = await _dio.post(
        '$BASE_Endpoint/wp-json/wp/v2/users',
        data: user.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      print('its work $response');
      // if (response.statusCode == 201) {
      //   return await login(user.name!, user.password!);
      // }
      return false;
    } on DioException catch (e) {
      print('Signup failed: ${e.response?.data}');
      return false;
    }
  }
}
