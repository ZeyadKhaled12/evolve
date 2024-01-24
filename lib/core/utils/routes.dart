import 'package:get/get.dart';
import 'package:tdh_event/features/auth/view/pages/forget_password_screen.dart';
import 'package:tdh_event/features/auth/view/pages/splash_screen.dart';
import 'package:tdh_event/features/home/bindings/home_binding.dart';
import 'package:tdh_event/features/home/view/pages/change_password_screen.dart';
import 'package:tdh_event/features/home/view/pages/create_user_screen.dart';
import 'package:tdh_event/features/home/view/pages/main_screen.dart';
import 'package:tdh_event/features/home/view/pages/users_screen.dart';
import '../../features/auth/bindings/auth_binding.dart';
import '../../features/auth/view/pages/login_screen.dart';
import '../../features/home/view/pages/update_user_screen.dart';

final routes = [
  GetPage(
    name: SplashScreen.route,
    binding: AuthBindings(),
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: LoginScreen.route,
    binding: AuthBindings(),
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: ForgetPasswordScreen.route,
    binding: AuthBindings(),
    page: () => const ForgetPasswordScreen(),
  ),
  GetPage(
    name: MainScreen.route,
    binding: HomeBindings(),
    page: () => const MainScreen(),
  ),
  GetPage(
    name: UsersScreen.route,
    binding: HomeBindings(),
    page: () => const UsersScreen(),
  ),
  GetPage(
    name: CreateUserScreen.route,
    binding: HomeBindings(),
    page: () => const CreateUserScreen(),
  ),
  GetPage(
    name: UpdateUserScreen.route,
    binding: HomeBindings(),
    page: () => const UpdateUserScreen(),
  ),
  GetPage(
    name: ChangePasswordScreen.route,
    binding: HomeBindings(),
    page: () => const ChangePasswordScreen(),
  ),
];
