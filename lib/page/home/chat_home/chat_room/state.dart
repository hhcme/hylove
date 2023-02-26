import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hylove/model/model.dart';


class ChatRoomState {
  ChatRoomState();

  final Rx<UserInfo?> userInfo = Rx(null);

  final TextEditingController textEditingController = TextEditingController();

  /// 当前的展开状态
  bool isShowStatus = false;

  final RxBool showSend = false.obs;

  late final Animation<double> height;
}
