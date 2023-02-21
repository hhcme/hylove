import 'package:flutter/animation.dart';
import 'package:hylove/model/model.dart';

class TaskHomeState {
  TaskHomeState();

  /// 当前的展开状态
  bool isShowStatus = false;

  late final Animation<double> height;
  late final Animation<double> transform;

  List<TaskInfo> elements = [
    TaskInfo(),
    TaskInfo()
  ];
}
