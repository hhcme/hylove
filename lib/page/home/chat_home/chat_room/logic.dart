import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hy_get/hy_get.dart';
import 'package:flutter/material.dart';
import 'package:hylove/model/model.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/page/middle_control/middle_control.dart';
import 'state.dart';

class ChatRoomLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final ChatRoomState state = ChatRoomState();

  late AnimationController animationController;

  final Duration duration = const Duration(milliseconds: 500);

  final MiddleControlLogic middle = Get.find<MiddleControlLogic>();

  /// 发送信息
  void createMsg() async {
    final int index = state.itemList.value.length;
    final String txt = state.textEditingController.text;
    state.itemList.value.insert(index, MsgInfo(txt, sendUserId: index.isEven ? 1 : 2));
    state.listKey.currentState?.insertItem(index, duration: const Duration(milliseconds: 500));
    await Future.delayed(const Duration(milliseconds: 100));
    // 滚动到底部
    state.scrollController.animateTo(state.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOutBack);
    state.textEditingController.clear();
    state.showSend.value = false;
    GetStorage.init();
  }

  /// 打开聊天工具
  void openChatTool() async {
    if (animationController.isAnimating) {
      return;
    }

    if (state.isShowStatus == false) {
      await showChatTool();
    } else {
      await hideChatTool();
    }
  }

  /// 切换 语音/文字 输入
  void changeVoiceText() async {
    if (state.isInput.value == false) {
      state.isInput.value = true;
    } else {
      state.isInput.value = false;
    }
  }

  /// 制作动画
  void makeAnimation() {
    /// 高度动画
    state.boxHeight = Tween<double>(
      begin: screenUtil.adaptive(200),
      end: screenUtil.adaptive(800),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.1,
          0.9,
          curve: Curves.ease,
        ),
      ),
    );
  }

  /// 展开聊天工具
  Future<void> showChatTool() async {
    try {
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
      middle.hideMiddle();
      await animationController.forward().orCancel;
      state.isShowStatus = true;
    } on TickerCanceled {}
  }

  /// 隐藏聊天工具
  Future<void> hideChatTool() async {
    try {
      middle.showMiddle();
      state.isShowStatus = false;
      await animationController.reverse().orCancel;
    } on TickerCanceled {}
  }

  /// 输入框的焦点
  void _listenInputFocusNode() async {
    if (state.inputFocusNode.hasFocus) {
      print('inputFocusNode得到焦点');
      await hideChatTool();
      await Future.delayed(const Duration(milliseconds: 500));
      // 滚动到底部
      state.scrollController.animateTo(state.scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInToLinear);
    } else {
      print('inputFocusNode失去焦点');
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is! UserInfo) {
      throw Exception('进入聊天界面的数据类型错误');
    }
    state.userInfo.value = Get.arguments;
    animationController = AnimationController(vsync: this, duration: duration);
    makeAnimation();
    state.inputFocusNode.addListener(_listenInputFocusNode);
  }

  @override
  void onClose() {
    middle.showMiddle();
    state.inputFocusNode.removeListener(_listenInputFocusNode);
    super.dispose();
  }
}
