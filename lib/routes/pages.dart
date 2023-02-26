import 'package:get/get.dart';
import 'package:hylove/page/home/app_home/app_home.dart';
import 'package:hylove/page/home/chat_home/chat_home.dart';
import 'package:hylove/page/home/chat_home/chat_room/chat_room.dart';
import 'package:hylove/page/home/login_home/login_home.dart';
import 'package:hylove/page/home/login_home/register_user/register_user.dart';
import 'package:hylove/page/home/photo_home/photo_home.dart';
import 'package:hylove/page/home/set_home/set_home.dart';
import 'package:hylove/page/home/task_home_view/task_home.dart';
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

    /// 任务首页
    GetPage(
        name: _Paths.taskHome,
        page: () => const TaskHomeView(),
        binding: TaskHomeBinding(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500)),

    /// 设置首页
    GetPage(
        name: _Paths.setHome,
        page: () => const SetHomeView(),
        binding: SetHomeBinding(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500)),

    /// 聊天首页
    GetPage(
        name: _Paths.chatHome,
        page: () => const ChatHomeView(),
        binding: ChatHomeBinding(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500),
        children: [
          /// 聊天房间
          GetPage(
              name: _Paths.chatRoom,
              page: () => const ChatRoomView(),
              binding: ChatRoomBinding(),
              transition: Transition.rightToLeftWithFade,
              transitionDuration: const Duration(milliseconds: 200)),
        ]),

    /// test
    GetPage(
        name: _Paths.test,
        page: () => const TestView(),
        binding: TestBinding(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}
