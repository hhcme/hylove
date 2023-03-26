import 'package:flutter/material.dart';
import 'package:base_widget/base_widget.dart';
import 'package:get/get.dart';

class ChatRoomSettingCheckBoxItemView extends StatelessWidget {
  const ChatRoomSettingCheckBoxItemView({super.key, required this.onTap, required this.name, required this.status});

  /// 点击按钮的事件
  final VoidCallback onTap;

  /// 功能名称
  final String name;

  /// 按钮状态
  final RxBool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenUtil.adaptive(130),
      decoration: const BoxDecoration(color: Colors.white),
      child: Obx(() => SwitchListTile.adaptive(
            value: status.value,
            onChanged: (value) {
              onTap();
            },
            activeColor: const Color(0xFFF5B0FF),
            inactiveTrackColor: const Color(0xFFF0EFF5),
            title: Text(
              name,
              style: TextStyle(fontSize: screenUtil.adaptive(45), color: Colors.black),
            ),
          )),
    );
  }
}
