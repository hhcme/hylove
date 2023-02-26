import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hylove/model/model.dart';

class MiddleControlState {
  MiddleControlState();

  /// 当前的展开状态
  bool isShowStatus = false;

  /// 当前的展开状态
  RxBool isOpacity = true.obs;

  final Rx<UserInfo?> userInfo = Rx(null);

  final FocusNode focusNode = FocusNode();
  late final Animation<double> height;
  late final Animation<double> width;
  late final Animation<double> borderRadius;
  late final Animation<double> middlePadding;
  late final Animation<double> opacity;
}
