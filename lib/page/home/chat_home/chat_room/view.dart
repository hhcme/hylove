import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/routes/pages.dart';
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
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.CHAT_ROOM_SETTING);
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              margin: EdgeInsets.only(
                right: screenUtil.adaptive(30),
              ),
              child: Center(
                child: Icon(
                  const IconData(0xe8c4, fontFamily: 'MyIcons'),
                  size: screenUtil.adaptive(80),
                ),
              ),
            ),
          )
        ],
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
                  height: controller.state.boxHeight.value,
                  decoration: const BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.only(
                    bottom: screenUtil.adaptive(70),
                    left: screenUtil.adaptive(30),
                    right: screenUtil.adaptive(30),
                    top: screenUtil.adaptive(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenUtil.adaptive(100),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                controller.changeVoiceText();
                              },
                              behavior: HitTestBehavior.opaque,
                              child: SizedBox(
                                width: screenUtil.adaptive(90),
                                height: screenUtil.adaptive(90),
                                child: Center(
                                  child: Obx(() => Icon(
                                        controller.state.isInput.value
                                            ? const IconData(0xe805, fontFamily: 'MyIcons')
                                            : const IconData(0xe661, fontFamily: 'MyIcons'),
                                        size: screenUtil.adaptive(70),
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              height: screenUtil.adaptive(120),
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
                              child: Obx(() => Visibility(
                                    visible: controller.state.isInput.value,
                                    replacement: Center(
                                      child: Text(
                                        '按住说话',
                                        style: TextStyle(fontSize: screenUtil.adaptive(50)),
                                      ),
                                    ),
                                    child: TextField(
                                      focusNode: controller.state.inputFocusNode,
                                      controller: controller.state.textEditingController,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        isCollapsed: true,
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
                            )),
                            GestureDetector(
                              onTap: () {
                                if (controller.state.showSend.value) {
                                } else {
                                  controller.openChatTool();
                                  FocusScope.of(context).requestFocus(FocusNode());
                                }
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
