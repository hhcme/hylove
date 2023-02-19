import 'package:get/get.dart';
import 'package:hylove/page/home/app_home/app_home.dart';
import 'package:hylove/page/home/login_home/login_home.dart';
import 'package:hylove/page/home/login_home/register_user/register_user.dart';
import 'package:hylove/page/home/photo_home/photo_home.dart';
import 'package:hylove/page/test/test.dart';

part 'routes.dart';

class AppPages {
  static final routes = [
    /// APP首页
    GetPage(
        name: _Paths.appHome,
        page: () => const AppHomeView(),
        binding: AppHomeBinding(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500)),

    /// 登陆首页
    GetPage(
        name: _Paths.loginHome,
        page: () => const LoginHomeView(),
        binding: LoginHomeBinding(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500),
        children: [
          /// 注册账号
          GetPage(
              name: _Paths.registerUser,
              page: () => const RegisterView(),
              binding: RegisterBinding(),
              transition: Transition.circularReveal,
              transitionDuration: const Duration(milliseconds: 500)),
        ]),

    /// 相册首页
    GetPage(
        name: _Paths.photoHome,
        page: () => const PhotoHomeView(),
        binding: PhotoHomeBinding(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500)),

    /// test
    GetPage(
        name: _Paths.test,
        page: () => const TestView(),
        binding: TestBinding(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}
