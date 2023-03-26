import 'package:get/get.dart';

class ChatRoomSettingState {
  ChatRoomSettingState();

  /// 消息免打扰
  final RxBool isDisturb = false.obs;

  /// 置顶
  final RxBool isTop = false.obs;
}
