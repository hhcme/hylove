import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hylove/model/model.dart';

class ChatRoomState {
  ChatRoomState();

  final Rx<UserInfo?> userInfo = Rx(null);

  final TextEditingController textEditingController = TextEditingController();

  /// 当前的展开状态
  bool isShowStatus = false;

  /// 输入文字模式
  final RxBool isInput = true.obs;

  /// 显示发送按钮
  final RxBool showSend = false.obs;

  /// 输入框外壳的高度
  late final Animation<double> boxHeight;

  /// 输入框外壳的焦点
  final FocusNode inputFocusNode = FocusNode();
}
