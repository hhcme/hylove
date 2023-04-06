import 'package:hy_get/hy_get.dart';
import 'package:hylove/model/model.dart';

class ChatItemState {
  ChatItemState();

  final Rx<UserInfo?> userInfo = Rx(UserInfo());
}
