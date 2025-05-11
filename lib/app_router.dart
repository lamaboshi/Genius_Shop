import 'package:genius_shop/Pages/login/view/login_view.dart';
import 'package:genius_shop/Pages/splash_screen/view/splash_view.dart';
import 'package:get/get.dart';

import 'Pages/forgot_password/binding/forget_password_binding.dart';
import 'Pages/forgot_password/view/forget_password_view.dart';
import 'Pages/login/binding/login_binding.dart';
import 'Pages/register/binding/register_binding.dart';
import 'Pages/register/view/registor_view.dart';
import 'Pages/splash_screen/binding/splash_binding.dart';

class AppRouter {
  static final splash = '/splash';
  static final logIn = '/login';
  static final register = '/register';
  static final password = '/password';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: logIn,
      page: () => const LoginView(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: password,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
  ];
}
