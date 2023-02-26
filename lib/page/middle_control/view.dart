import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/routes/pages.dart';

import 'logic.dart';

class MiddleControlView extends GetView<MiddleControlLogic> {
  const MiddleControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller.boxTransparentAnimationController,
        builder: (BuildContext context, child) {
        return Opacity(opacity: controller.state.opacity.value,child: GestureDetector(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  /// 头像
                                  Obx(() => GestureDetector(
                                    onTap: () async {
                                      if (!controller.state.isShowStatus) {
                                        FocusScope.of(context).requestFocus(controller.state.focusNode);
                                        return;
                                      }
                                      controller.goLogin();
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(screenUtil.adaptive(100)),
                                      child: controller.state.userInfo.value != null
                                          ? Image.asset(
                                        controller.state.userInfo.value!.avatarUrl,
                                        width: screenUtil.adaptive(200),
                                        height: screenUtil.adaptive(200),
                                      )
                                          : Container(
                                        width: screenUtil.adaptive(200),
                                        height: screenUtil.adaptive(200),
                                        decoration: const BoxDecoration(color: Color(0xFFF5B0FF)),
                                        child: Icon(
                                          const IconData(0xe611, fontFamily: 'MyIcons'),
                                          size: screenUtil.adaptive(120),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )),

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
                                            Obx(() => Container(
                                              height: screenUtil.adaptive(90),
                                              margin: EdgeInsets.only(
                                                  left: screenUtil.adaptive(40), right: screenUtil.adaptive(40)),
                                              child: Text(
                                                controller.state.userInfo.value != null
                                                    ? controller.state.userInfo.value!.nickName
                                                    : '未登录',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: screenUtil.adaptive(55),
                                                    decoration: TextDecoration.none),
                                              ),
                                            )),
                                            Obx(() => Container(
                                              height: screenUtil.adaptive(70),
                                              margin: EdgeInsets.only(
                                                  left: screenUtil.adaptive(40),
                                                  right: screenUtil.adaptive(40),
                                                  top: screenUtil.adaptive(10)),
                                              child: Text(
                                                controller.state.userInfo.value != null
                                                    ? controller.state.userInfo.value!.description
                                                    : '',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: screenUtil.adaptive(30),
                                                    decoration: TextDecoration.none),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
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
                            Container(
                              padding: EdgeInsets.only(left: screenUtil.adaptive(30), right: screenUtil.adaptive(30)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  /// 回首页
                                  SizedBox(
                                    width: screenUtil.adaptive(130),
                                    height: screenUtil.adaptive(130),
                                    child: TextButton(
                                      onPressed: () {
                                        Get.until((route) =>
                                        route.settings.name == Routes.APP_HOME || route.settings.name == '/');
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(65))),
                                      ),
                                      child: Icon(
                                        Icons.home,
                                        size: screenUtil.adaptive(80),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                                  /// 去私信
                                  SizedBox(
                                      width: screenUtil.adaptive(130),
                                      height: screenUtil.adaptive(130),
                                      child: TextButton(
                                          onPressed: () {
                                            Get.toNamed(Routes.CHAT_HOME);
                                          },
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(65))),
                                          ),
                                          child: Icon(
                                            const IconData(0xe626, fontFamily: 'MyIcons'),
                                            size: screenUtil.adaptive(80),
                                            color: Colors.white,
                                          ))),

                                  /// 去任务
                                  SizedBox(
                                      width: screenUtil.adaptive(130),
                                      height: screenUtil.adaptive(130),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(65))),
                                        ),
                                        child: Icon(
                                          Icons.book,
                                          size: screenUtil.adaptive(80),
                                          color: Colors.white,
                                        ),
                                      )),

                                  /// 去日记
                                  SizedBox(
                                      width: screenUtil.adaptive(130),
                                      height: screenUtil.adaptive(130),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(65))),
                                        ),
                                        child: Icon(
                                          Icons.person,
                                          size: screenUtil.adaptive(80),
                                          color: Colors.white,
                                        ),
                                      )),

                                  /// 去关于app
                                  SizedBox(
                                      width: screenUtil.adaptive(130),
                                      height: screenUtil.adaptive(130),
                                      child: TextButton(
                                        onPressed: () =>controller.xxx(),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(65))),
                                        ),
                                        child: Icon(
                                          Icons.info,
                                          size: screenUtil.adaptive(80),
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ));
            },
            animation: controller.boxShapeAnimationController,
          ),
        ),);
      }
    );
  }
}
