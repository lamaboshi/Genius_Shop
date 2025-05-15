import 'package:genius_shop/Pages/edit_profile/binding/edit_profile_binding.dart';
import 'package:genius_shop/Pages/edit_profile/view/edit_profile_view.dart';
import 'package:genius_shop/Pages/login/view/login_view.dart';
import 'package:genius_shop/Pages/product/bindings/product_binding.dart';
import 'package:genius_shop/Pages/product/view/product_view.dart';
import 'package:genius_shop/Pages/profile/binding/profile_binding.dart';
import 'package:genius_shop/Pages/profile/view/profile_view.dart';
import 'package:genius_shop/Pages/splash_screen/view/splash_view.dart';
import 'package:get/get.dart';

import 'Pages/forgot_password/binding/forget_password_binding.dart';
import 'Pages/forgot_password/view/confirm_email_view.dart';
import 'Pages/forgot_password/view/forget_password_view.dart';
import 'Pages/home/binding/home_binding.dart';
import 'Pages/home/view/home_view.dart';
import 'Pages/login/binding/login_binding.dart';
import 'Pages/register/binding/register_binding.dart';
import 'Pages/register/view/registor_view.dart';
import 'Pages/splash_screen/binding/splash_binding.dart';
import 'core/middleware/auth_middleware.dart';

class AppRouter {
  static final splash = '/splash';
  static final logIn = '/login';
  static final register = '/register';
  static final password = '/password';
  static final confirm = '/confirm';
  static final home = '/home';
  static final product = '/product';
  static final profile = '/profile';
  static final editProfile = '/edit_profile';

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
      name: product,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: editProfile,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: password,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
      children: [GetPage(name: confirm, page: () => ConfirmEmailView())],
    ),
    GetPage(
      name: confirm,
      page: () => ConfirmEmailView(),
      binding: ForgetPasswordBinding(),
      children: [GetPage(name: password, page: () => ForgetPasswordView())],
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      bindings: [HomeBinding(), ProfileBinding()],
      children: [GetPage(name: profile, page: () => const ProfileView())],
      middlewares: [AuthMiddleware()],
    ),
  ];
}
