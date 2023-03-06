import 'package:flutter/material.dart';
import 'package:base_widget/base_widget.dart';

class ChatRoomSettingCheckBoxItemView extends StatelessWidget {
  const ChatRoomSettingCheckBoxItemView({super.key, required this.onTap, required this.name, this.hasDownLine = true});

  final VoidCallback onTap;

  final String name;

  final bool hasDownLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenUtil.adaptive(120),
      decoration: const BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(
        bottom: screenUtil.adaptive(20),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: SwitchListTile(
          value: true,
          onChanged: (value) {},
          activeColor: Colors.red,
          activeTrackColor: Colors.blue,
          inactiveThumbColor: Colors.yellow,
          inactiveTrackColor: Colors.black,
          title: Text(
            name,
            style: TextStyle(fontSize: screenUtil.adaptive(40), color: Colors.black),
          ),
        ),
      ),
    );
  }
}
