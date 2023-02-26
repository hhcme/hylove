import 'package:get/get.dart';
import 'package:hylove/model/model.dart';

class ChatItemState {
  ChatItemState();

  final Rx<UserInfo?> userInfo = Rx(UserInfo());
}
