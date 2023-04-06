import 'package:hy_get/hy_get.dart';

class ChatRoomSettingState {
  ChatRoomSettingState();

  /// 消息免打扰
  final RxBool isDisturb = false.obs;

  /// 置顶
  final RxBool isTop = false.obs;
}
