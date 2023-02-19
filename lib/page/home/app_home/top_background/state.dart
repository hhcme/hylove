import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class TopBackgroundState {
  TopBackgroundState();
  final RxDouble topBackGroundImgHeight = 700.0.obs;

  final int days = 1314;

  late final Animation<double> height;

  /// false为缩起来滑动，true为展开时滑动
  bool topVerticalMode =false;

  /// 下滑开始的位置
  Offset verticalStart = const Offset(0, 0);
}
