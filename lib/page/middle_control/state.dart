import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class MiddleControlState {
  MiddleControlState();

  /// 当前的展开状态
  bool isShowStatus = false;

  final FocusNode focusNode=FocusNode();
  late final Animation<double> height;
  late final Animation<double> width;
  late final Animation<double> borderRadius;
  late final Animation<double> middlePadding;
}
