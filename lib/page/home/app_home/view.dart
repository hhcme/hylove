import 'package:flutter/material.dart';
import 'package:hy_get/hy_get.dart';
import 'package:hylove/page/home/app_home/top_background/top_background.dart';
import 'package:hylove/page/home/task_home_view/task_home.dart';
import 'package:hylove/page/middle_control/middle_control.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/routes/pages.dart';
import 'logic.dart';

class AppHomeView extends GetView<AppHomeLogic> {
  const AppHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!controller.state.isLoadMiddle) {
      controller.putMiddleControl(context);
    }
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          /// 这是顶部的首页照片和纪念日
          Row(
            children: [
              LogicWrap(getInstance: () => TopBackgroundLogic(), child: const TopBackgroundView()),
            ],
          ),

          /// 这里是一些简单的功能入口

          ///
          SizedBox(
            // width: screenUtil.adaptive(0),
            height: screenUtil.adaptive(500),
            child: Center(
              child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.TASK_HOME);
                  },
                  child: const Text('go')),
            ),
          )
        ],
      ),
    ));
  }
}
