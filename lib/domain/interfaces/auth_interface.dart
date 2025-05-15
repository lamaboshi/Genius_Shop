import '../model/user.dart';

abstract class IAuthRepository {
  Future<User?> login(String username, String password);
  Future<User?> getCurrentUser();
  Future<bool> signup(User user);
  User? getUserData();
  Future<bool> sendPasswordResetEmail(String email);
  Future<bool> resetPassword({
    required String resetKey,
    required String newPassword,
    required String userLogin,
  });
}
