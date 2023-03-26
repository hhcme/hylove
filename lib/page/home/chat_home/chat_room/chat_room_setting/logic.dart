import 'package:get/get.dart';

import 'state.dart';

class ChatRoomSettingLogic extends GetxController {
  final ChatRoomSettingState state = ChatRoomSettingState();

  /// 打开免打扰开关
  void openDisturb() async {
    state.isDisturb.toggle();
  }

  /// 打开置顶开关
  void openTop() async {
    state.isTop.toggle();
  }
}
