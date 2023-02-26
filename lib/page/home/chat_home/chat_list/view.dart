import 'package:flutter/material.dart';
import 'package:base_widget/base_widget.dart';
import 'package:get/get.dart';
import 'package:hylove/page/home/chat_home/chat_list/chat_item/chat_item.dart';
import 'logic.dart';

class ChatListView extends GetView<ChatListLogic> {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: controller.state.list.value.length,
        // todo 这里的tag需要重新替换到时候
        itemBuilder: (_, int index) => ChatItemView(index.toString(), index));
  }
}
