import 'package:flutter/animation.dart';

class TaskHomeState {
  TaskHomeState();

  /// 当前的展开状态
  bool isShowStatus = false;

  late final Animation<double> height;
  late final Animation<double> transform;

  List elements = [
    {'name': 'John', 'group': 'Team A'},
    {'name': 'Will', 'group': 'Team B'},
    {'name': 'Beth', 'group': 'Team A'},
    {'name': 'Miranda', 'group': 'Team B'},
    {'name': 'Mike', 'group': 'Team C'},
    {'name': 'Danny', 'group': 'Team C'},
  ];
}
