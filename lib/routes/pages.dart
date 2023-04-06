import 'package:hy_get/hy_get.dart';
import 'package:hylove/page/home/app_home/app_home.dart';
import 'package:hylove/page/home/chat_home/chat_home.dart';
import 'package:hylove/page/home/chat_home/chat_room/chat_room.dart';
import 'package:hylove/page/home/chat_home/chat_room/chat_room_setting/chat_room_setting.dart';
import 'package:hylove/page/home/login_home/login_home.dart';
import 'package:hylove/page/home/login_home/register_user/register_user.dart';
import 'package:hylove/page/home/note_home/note_home.dart';
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
        transition: Transition.circularReveal),

    /// 登陆首页
    GetPage(
        name: _Paths.loginHome,
        page: () => const LoginHomeView(),
        binding: LoginHomeBinding(),
        transition: Transition.circularReveal,
        children: [
          /// 注册账号
          GetPage(
              name: _Paths.registerUser,
              page: () => const RegisterView(),
              binding: RegisterBinding(),
              transition: Transition.circularReveal),
        ]),

    /// 相册首页
    GetPage(
        name: _Paths.photoHome,
        page: () => const PhotoHomeView(),
        binding: PhotoHomeBinding(),
        transition: Transition.circularReveal),

    /// 任务首页
    GetPage(
        name: _Paths.taskHome,
        page: () => const TaskHomeView(),
        binding: TaskHomeBinding(),
        transition: Transition.circularReveal),

    /// 设置首页
    GetPage(
        name: _Paths.setHome,
        page: () => const SetHomeView(),
        binding: SetHomeBinding(),
        transition: Transition.circularReveal),

    /// 聊天首页
    GetPage(
        name: _Paths.chatHome,
        page: () => const ChatHomeView(),
        binding: ChatHomeBinding(),
        transition: Transition.circularReveal,
        children: [
          /// 聊天房间
          GetPage(
              name: _Paths.chatRoom,
              page: () => const ChatRoomView(),
              binding: ChatRoomBinding(),
              transition: Transition.circularReveal,
              children: [
                /// 聊天 - 设置
                GetPage(
                    name: _Paths.chatRoomSetting,
                    page: () => const ChatRoomSettingView(),
                    binding: ChatRoomSettingBinding(),
                    transition: Transition.circularReveal),
              ]),
        ]),

    /// 日记首页
    GetPage(
        name: _Paths.noteHome,
        page: () => const NoteHomeView(),
        binding: NoteHomeBinding(),
        transition: Transition.circularReveal),

    /// test
    GetPage(
        name: _Paths.test, page: () => const TestView(), binding: TestBinding(), transition: Transition.circularReveal),
  ];
}
