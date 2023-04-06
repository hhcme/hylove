import 'package:hy_get/hy_get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_widget/base_widget.dart';
import 'state.dart';

class TopBackgroundLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final TopBackgroundState state = TopBackgroundState();

  late AnimationController animationController;

  final Duration duration = const Duration(milliseconds: 500);

  void verticalStart(DragStartDetails e) async {
    if (state.topBackGroundImgHeight.value >= 1100.0) {
      state.topVerticalMode = true;
    } else {
      state.topVerticalMode = false;
    }
    state.verticalStart = e.localPosition;
  }

  void verticalUpdate(DragUpdateDetails e) async {
    final int num = (e.localPosition.dy - state.verticalStart.dy).round();
    state.topBackGroundImgHeight.value = (state.topVerticalMode ? 1200.0 : 700.0) + num;
  }

  void verticalEnd(DragEndDetails e) async {
    if (state.topBackGroundImgHeight.value < 900.0) {
      state.topBackGroundImgHeight.value = 700.0;
      return;
    }
    state.topBackGroundImgHeight.value = 1200.0;
  }

  void makeAnimation() {
    /// 高度动画
    state.height = Tween<double>(
      begin: screenUtil.adaptive(state.topBackGroundImgHeight.value),
      end: screenUtil.adaptive(1000),
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

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(vsync: this, duration: duration);
    makeAnimation();
  }
}
