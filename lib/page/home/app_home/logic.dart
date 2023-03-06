import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/page/middle_control/middle_control.dart';
import 'state.dart';

class AppHomeLogic extends GetxController {
  final AppHomeState state = AppHomeState();

  void putMiddleControl(BuildContext context) async {
    /// 中控界面
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        right: screenUtil.adaptive(0),
        bottom: screenUtil.adaptive(0),
        child: Container(
          padding: EdgeInsets.only(right: screenUtil.adaptive(60), bottom: screenUtil.adaptive(240)),
          child: LogicWrap(
              getInstance: () => MiddleControlLogic(state: MiddleControlState()), child: const MiddleControlView()),
        ),
      );
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      Overlay.of(context)?.insert(overlayEntry);
      state.isLoadMiddle = true;
    });
  }
}
