import 'package:flutter/material.dart';
import 'package:hy_get/hy_get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/page/home/chat_home/chat_room/chat_room_setting/componment/chat_room_setting_checkBox_item.dart';
import 'package:hylove/page/home/chat_home/chat_room/chat_room_setting/componment/chat_room_setting_onTap_item.dart';

import 'logic.dart';

class ChatRoomSettingView extends GetView<ChatRoomSettingLogic> {
  const ChatRoomSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        backgroundColor: const Color(0xFFF0EFF5),
      ),
      backgroundColor: const Color(0xFFF0EFF5),
      body: ListView(
        children: [
          ChatRoomSettingCheckBoxItemView(
              name: '消息免打扰', status: controller.state.isDisturb, onTap: () => controller.openDisturb()),
          ChatRoomSettingCheckBoxItemView(
              name: '置顶聊天', status: controller.state.isTop, onTap: () => controller.openTop()),
          ChatRoomSettingOnTapItemView(name: '查找聊天记录', onTap: () {}),
          ChatRoomSettingOnTapItemView(name: '设置当前聊天背景', onTap: () {}),
          ChatRoomSettingOnTapItemView(name: '举报', onTap: () {}),
          Container(
              height: screenUtil.adaptive(120),
              margin: EdgeInsets.only(
                top: screenUtil.adaptive(20),
                left: screenUtil.adaptive(50),
                right: screenUtil.adaptive(50),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: screenUtil.adaptive(900),
                  height: screenUtil.adaptive(130),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenUtil.adaptive(30)),
                  ),
                  child: Center(
                    child: Text(
                      '删除聊天',
                      style: TextStyle(color: Colors.red, fontSize: screenUtil.adaptive(50)),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
