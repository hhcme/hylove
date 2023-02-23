import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/routes/pages.dart';

import 'state.dart';

class MiddleControlLogic extends GetxController with GetSingleTickerProviderStateMixin {
  MiddleControlLogic({required this.state});
  final MiddleControlState state;

  late AnimationController animationController;

  final Duration duration = const Duration(milliseconds: 500);

  Future<void> goLogin() async {
    if(!state.isShowStatus){
      return;
    }
    Get.toNamed(Routes.LOGIN_HOME);
  }

  void makeAnimation() {
    /// 高度动画
    state.height = Tween<double>(
      begin: screenUtil.adaptive(200),
      end: screenUtil.adaptive(420),
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

    /// 宽度动画
    state.width = Tween<double>(
      begin: screenUtil.adaptive(200),
      end: screenUtil.adaptive(880),
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

    /// 圆角动画
    state.borderRadius = Tween<double>(
      begin: screenUtil.adaptive(100),
      end: screenUtil.adaptive(50),
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

    /// 中控内边距
    state.middlePadding = Tween<double>(
      begin: screenUtil.adaptive(0),
      end: screenUtil.adaptive(50),
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
  void onReady() {
    super.onReady();
    state.focusNode.addListener(() async {
      if (state.focusNode.hasFocus) {
        if (state.isShowStatus == false) {
          print('监听得到焦点');
          await show();
          return;
        }
        print('已经展开无操作');
      } else {
        print('监听失去焦点');
        await hide();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(vsync: this, duration: duration);
    makeAnimation();
  }
}
