import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:genius_shop/core/api/storage_service.dart';
import 'package:genius_shop/domain/model/user.dart';
import 'package:get/get.dart';
import '../../core/helper/dio_api_handler.dart';
import '../../main.dart';
import '../interfaces/auth_interface.dart';

class AuthRepository extends IAuthRepository {
  final _dio = Get.find<Dio>();

  final _storage = Get.find<StorageService>();

  @override
  Future<User?> login(
    String username,
    String password, {
    bool rememberMe = true,
  }) async {
    try {
      final response = await _dio.post(
        '$BASE_Endpoint/wp-json/jwt-auth/v1/token',
        data: {'username': username, 'password': password},
      );
      if (rememberMe) {
        _storage.saveData(StorageService.authToken, response.data['token']);
      }

      final result = await getCurrentUser(rememberMe: rememberMe);
      return result;
    } on DioException catch (e) {
      print('Login failed: ${e.response?.data}');
      return null;
    }
  }

  @override
  Future<User?> getCurrentUser({bool rememberMe = true}) async {
    final token = _storage.getData(StorageService.authToken);
    print('the Token : $token');
    try {
      final response = await _dio.get(
        '$BASE_Endpoint/wp-json/wp/v2/users/me',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        if (rememberMe) {
          _storage.saveData(StorageService.userData, jsonEncode(response.data));
        }
        return User.fromMap(response.data);
      }
    } on DioException catch (e) {
      print('Login failed: ${e.response?.data}');
    }
    return null;
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
    return true;
  }

  @override
  Future<bool> sendPasswordResetEmail(String email) async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.post(
            '$BASE_Endpoint/wp/v2/users/lost-password',
            data: jsonEncode({'user_login': email}),
            options: Options(headers: {'Content-Type': 'application/json'}),
          ),
      operationName: 'lost-password',
    );
    return response.statusCode == 200;
  }

  @override
  Future<bool> resetPassword({
    required String resetKey,
    required String newPassword,
    required String userLogin,
  }) async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.post(
            '$BASE_Endpoint/wp-json/wp/v2/users/reset-password',
            data: jsonEncode({
              'key': resetKey,
              'password': newPassword,
              'user_login': userLogin,
            }),
            options: Options(headers: {'Content-Type': 'application/json'}),
          ),
      operationName: 'users/reset-password',
    );

    return response.statusCode == 200;
  }
}
