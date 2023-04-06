import 'package:hy_get/hy_get.dart';
import 'package:flutter/animation.dart';
import 'package:base_widget/base_widget.dart';
import 'dart:math' as math;
import 'state.dart';

class TaskHomeLogic extends GetxController with GetSingleTickerProviderStateMixin {
  TaskHomeLogic();
  final TaskHomeState state = TaskHomeState();

  late AnimationController animationController;

  final Duration duration = const Duration(milliseconds: 500);

  void makeAnimation() {
    /// 高度动画
    state.height = Tween<double>(
      begin: screenUtil.adaptive(390),
      end: screenUtil.adaptive(650),
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

    /// 三角形旋转动画
    state.transform = Tween<double>(
      begin: 0,
      end: math.pi,
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

  show() async {
    try {
      //先正向执行动画
      await animationController.forward().orCancel;
    } on TickerCanceled {}
  }

  hide() async {
    try {
      //再反向执行动画
      await animationController.reverse().orCancel;
    } on TickerCanceled {}
  }

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(vsync: this, duration: duration);
    makeAnimation();
  }
}
