import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:hylove/routes/pages.dart';

import 'state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();

  /// 跳转页面
  void jumpPage({int? appoint}) async {
    if (state.isAnimation) {
      return;
    }
    int? index;
    if (appoint != null) {
      index = appoint;
    } else {
      index = state.pageController.page?.toInt();
      if (index == null) {
        return;
      }
      if (index < 4) {
        index += 1;
      } else {
        Get.until((route) => route.settings.name == Routes.APP_HOME || route.settings.name == '/');
      }
    }

    state.isAnimation = true;
    state.pageController
        .animateToPage(index, duration: const Duration(milliseconds: 700), curve: Curves.ease)
        .whenComplete(() {
      state.isAnimation = false;
      state.index.value = index!;
    });
  }
}
