import 'package:hy_get/hy_get.dart';
import 'package:hylove/model/model.dart';

class ChatListState {
  ChatListState();

  final Rx<List<ChatInfo>> list = Rx([ChatInfo(), ChatInfo(), ChatInfo()]);
}
