import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/page/home/chat_home/chat_list/chat_list.dart';
import 'logic.dart';

/// 聊天首页
class ChatHomeView extends GetView<ChatHomeLogic> {
  const ChatHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('私信'),
        backgroundColor: const Color(0xFFF0EFF5),
      ),
      backgroundColor: const Color(0xFFF0EFF5),
      body: Padding(
        padding: EdgeInsets.only(
          left: screenUtil.adaptive(30),
          right: screenUtil.adaptive(30),
        ),
        child: Column(
          children: [
            /// 搜索框
            Container(
                height: screenUtil.adaptive(95),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenUtil.adaptive(20)),
                ),
                margin: EdgeInsets.only(
                  bottom: screenUtil.adaptive(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextField(
                      controller: controller.state.textEditingController.value,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusColor: Colors.grey,
                        hintText: "搜索",
                        contentPadding: EdgeInsets.only(
                          left: screenUtil.adaptive(50),
                        ),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          size: screenUtil.adaptive(60),
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (v) {
                        if (v.isNotEmpty) {
                          controller.state.showDelete.value = true;
                        } else {
                          controller.state.showDelete.value = false;
                        }
                      },
                    )),
                    Obx(() => controller.state.showDelete.value
                        ? Container(
                            margin: EdgeInsets.only(
                              right: screenUtil.adaptive(20),
                            ),
                            child: Icon(
                              const IconData(0xe65d, fontFamily: 'MyIcons'),
                              size: screenUtil.adaptive(60),
                              color: Colors.grey,
                            ),
                          )
                        : Container())
                  ],
                )),

            /// 私信列表
            Expanded(
              child: LogicWrap(getInstance: () => ChatListLogic(), child: const ChatListView()),
            )
          ],
        ),
      ),
    );
  }
}
