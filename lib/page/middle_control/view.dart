import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/routes/pages.dart';

import 'logic.dart';

class MiddleControlView extends GetView<MiddleControlLogic> {
  const MiddleControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!controller.state.isShowStatus) {
          FocusScope.of(context).requestFocus(controller.state.focusNode);
        }
      },
      behavior: HitTestBehavior.translucent,
      child: AnimatedBuilder(
        builder: (BuildContext context, child) {
          return Focus(
              focusNode: controller.state.focusNode,
              child: SizedOverflowBox(
                size: Size(controller.state.width.value, controller.state.height.value),
                child: Container(
                  width: controller.state.width.value,
                  height: controller.state.height.value,
                  padding: EdgeInsets.only(
                      top: screenUtil.adaptive(controller.state.middlePadding.value),
                      bottom: screenUtil.adaptive(controller.state.middlePadding.value),
                      left: screenUtil.adaptive(controller.state.middlePadding.value),
                      right: screenUtil.adaptive(controller.state.middlePadding.value)),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF5B0FF),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: screenUtil.adaptive(20),
                          color: const Color(0xFFF5B0FF),
                          offset: Offset(screenUtil.adaptive(2), screenUtil.adaptive(2)),
                        )
                      ],
                      borderRadius: BorderRadius.circular(controller.state.borderRadius.value)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 个人的信息面板
                      Row(
                        children: [
                          /// 头像
                          ClipRRect(
                            borderRadius: BorderRadius.circular(screenUtil.adaptive(100)),
                            child: Image.asset(
                              "asset/login/touxiang.JPG",
                              width: screenUtil.adaptive(200),
                              height: screenUtil.adaptive(200),
                            ),
                          ),

                          /// 中间的昵称和个性签名
                          if (controller.state.isShowStatus)
                            GestureDetector(
                              onTap: () => controller.goLogin(),
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: screenUtil.adaptive(20),
                                ),
                                width: screenUtil.adaptive(450),
                                height: screenUtil.adaptive(180),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: screenUtil.adaptive(90),
                                      margin: EdgeInsets.only(
                                          left: screenUtil.adaptive(40), right: screenUtil.adaptive(40)),
                                      child: Text(
                                        '我就是我',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenUtil.adaptive(55),
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                    Container(
                                      height: screenUtil.adaptive(70),
                                      margin: EdgeInsets.only(
                                          left: screenUtil.adaptive(40),
                                          right: screenUtil.adaptive(40),
                                          top: screenUtil.adaptive(10)),
                                      child: Text(
                                        '这是一个个性签名',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenUtil.adaptive(30),
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          /// 右边的设置按钮
                          if (controller.state.isShowStatus)
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.SET_HOME);
                                },
                                child: SizedBox(
                                  width: screenUtil.adaptive(150),
                                  height: screenUtil.adaptive(150),
                                  child: Icon(
                                    Icons.settings,
                                    size: screenUtil.adaptive(100),
                                    color: Colors.white,
                                  ),
                                ))
                        ],
                      ),

                      /// 分割线
                      if (controller.state.isShowStatus)
                        Container(
                          height: screenUtil.adaptive(1),
                          margin: EdgeInsets.only(
                              top: screenUtil.adaptive(30),
                              bottom: screenUtil.adaptive(20),
                              left: screenUtil.adaptive(30),
                              right: screenUtil.adaptive(30)),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),

                      /// 中控按钮
                      if (controller.state.isShowStatus)
                        Row(
                          children: [
                            Container(
                              width: screenUtil.adaptive(160),
                              height: screenUtil.adaptive(80),
                              margin: EdgeInsets.only(
                                bottom: screenUtil.adaptive(10),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.home,
                                  size: screenUtil.adaptive(80),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                                width: screenUtil.adaptive(160),
                                height: screenUtil.adaptive(80),
                                margin: EdgeInsets.only(
                                  bottom: screenUtil.adaptive(10),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.chat,
                                    size: screenUtil.adaptive(80),
                                    color: Colors.white,
                                  ),
                                )),
                            Container(
                                width: screenUtil.adaptive(160),
                                height: screenUtil.adaptive(80),
                                margin: EdgeInsets.only(
                                  bottom: screenUtil.adaptive(10),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.book,
                                    size: screenUtil.adaptive(80),
                                    color: Colors.white,
                                  ),
                                )),
                            Container(
                                width: screenUtil.adaptive(160),
                                height: screenUtil.adaptive(80),
                                margin: EdgeInsets.only(
                                  bottom: screenUtil.adaptive(10),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.person,
                                    size: screenUtil.adaptive(80),
                                    color: Colors.white,
                                  ),
                                )),
                            Container(
                                width: screenUtil.adaptive(160),
                                height: screenUtil.adaptive(80),
                                margin: EdgeInsets.only(
                                  bottom: screenUtil.adaptive(10),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.info,
                                    size: screenUtil.adaptive(80),
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        )
                    ],
                  ),
                ),
              ));
        },
        animation: controller.animationController,
      ),
    );
  }
}
