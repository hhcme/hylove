import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'logic.dart';

class TopBackgroundView extends GetView<TopBackgroundLogic> {
  const TopBackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (e) => controller.verticalStart(e),
      onVerticalDragUpdate: (e) => controller.verticalUpdate(e),
      onVerticalDragEnd: (e) => controller.verticalEnd(e),
      child: Obx(() => SizedBox(
            height: screenUtil.adaptive(controller.state.topBackGroundImgHeight.value),
            child: Stack(
              children: [
                ClipRect(
                  child: Image.asset(
                    "asset/login/bj.JPG",
                    fit: BoxFit.cover,
                    width: screenUtil.adaptive(1000),
                  ),
                ),
                Container(
                  // alignment: Alignment.center,
                  margin: EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top + screenUtil.adaptive(20)),
                  width: screenUtil.adaptive(1000),
                  height: screenUtil.adaptive(70),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(screenUtil.adaptive(40)),
                          child: Image.asset(
                            "asset/login/touxiang.JPG",
                            width: screenUtil.adaptive(80),
                            height: screenUtil.adaptive(80),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: screenUtil.adaptive(40), right: screenUtil.adaptive(40)),
                          child: Text('我们已经相爱了${controller.state.days}天',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w600, fontSize: screenUtil.adaptive(50))),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(screenUtil.adaptive(40)),
                          child: Image.asset(
                            "asset/login/touxiang.JPG",
                            width: screenUtil.adaptive(80),
                            height: screenUtil.adaptive(80),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
