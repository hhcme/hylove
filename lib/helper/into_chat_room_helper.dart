import 'package:hy_get/hy_get.dart';
import 'package:hylove/model/model.dart';
import 'package:hylove/routes/pages.dart';

class ChatRoomHelper {
  /// 前往私聊
  static Future<void> toPersonalRoom(UserInfo state) async {
    Get.toNamed(Routes.CHAT_ROOM, arguments: state);
  }

  /// 前往群聊
  static Future<void> toGroupRoom() async {}
}
