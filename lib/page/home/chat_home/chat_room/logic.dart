import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:hylove/model/model.dart';
import 'package:base_widget/base_widget.dart';
import 'state.dart';

class ChatRoomLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final ChatRoomState state = ChatRoomState();

  late AnimationController animationController;

  final Duration duration = const Duration(milliseconds: 500);

  void xxx() async {
    if (state.isShowStatus == false) {
      await show();
    } else {
      await hide();
    }
  }

  void makeAnimation() {
    /// 高度动画
    state.height = Tween<double>(
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

  Future<void> show() async {
    try {
      await animationController.forward().orCancel;
      state.isShowStatus = true;
    } on TickerCanceled {}
  }

  Future<void> hide() async {
    try {
      state.isShowStatus = false;
      await animationController.reverse().orCancel;
    } on TickerCanceled {}
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
  }
}
