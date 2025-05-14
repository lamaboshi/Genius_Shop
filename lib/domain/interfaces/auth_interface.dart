import '../model/user.dart';

abstract class IAuthRepository {
  Future<bool> login(String username, String password);
  Future<void> getCurrentUser();
  Future<bool> signup(User user);
  User? getUserData();
}
