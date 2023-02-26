import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'logic.dart';

/// 聊天界面
class ChatRoomView extends GetView<ChatRoomLogic> {
  const ChatRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.state.userInfo.value!.nickName)),
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF0EFF5),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [],
          )),
          AnimatedBuilder(
              animation: controller.animationController,
              builder: (BuildContext context, child) {
                return Container(
                  height: controller.state.height.value,
                  decoration: const BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.only(
                    bottom: screenUtil.adaptive(70),
                    left: screenUtil.adaptive(30),
                    right: screenUtil.adaptive(30),
                    top: screenUtil.adaptive(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: screenUtil.adaptive(100),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenUtil.adaptive(90),
                              height: screenUtil.adaptive(90),
                              child: Center(
                                child: Icon(
                                  const IconData(0xe805, fontFamily: 'MyIcons'),
                                  size: screenUtil.adaptive(70),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFF0EFF5),
                              ),
                              padding: EdgeInsets.only(
                                left: screenUtil.adaptive(20),
                                right: screenUtil.adaptive(20),
                                top: screenUtil.adaptive(20),
                                bottom: screenUtil.adaptive(20),
                              ),
                              margin: EdgeInsets.only(
                                left: screenUtil.adaptive(20),
                                right: screenUtil.adaptive(20),
                              ),
                              child: TextField(
                                controller: controller.state.textEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  isCollapsed: true,
                                  // contentPadding: EdgeInsets.only(
                                  //   left: screenUtil.adaptive(20),
                                  //   right: screenUtil.adaptive(20),
                                  //   top: screenUtil.adaptive(0),
                                  //   bottom: screenUtil.adaptive(0),
                                  // ),
                                  border: InputBorder.none,
                                ),
                                maxLines: 5,
                                minLines: 1,
                                onChanged: (v) {
                                  if (v.isNotEmpty) {
                                    controller.state.showSend.value = true;
                                  } else {
                                    controller.state.showSend.value = false;
                                  }
                                },
                              ),
                            )),
                            GestureDetector(
                              onTap: () {
                                controller.xxx();
                              },
                              child: SizedBox(
                                  width: screenUtil.adaptive(90),
                                  height: screenUtil.adaptive(90),
                                  child: Center(
                                    child: Obx(
                                      () => Icon(
                                        controller.state.showSend.value
                                            ? const IconData(0xe652, fontFamily: 'MyIcons')
                                            : const IconData(0xe665, fontFamily: 'MyIcons'),
                                        size: screenUtil.adaptive(90),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
