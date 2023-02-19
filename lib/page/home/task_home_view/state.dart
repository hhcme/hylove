import 'package:flutter/animation.dart';

class TaskHomeState {
  TaskHomeState();

  /// 当前的展开状态
  bool isShowStatus = false;

  late final Animation<double> height;
  late final Animation<double> transform;
}
