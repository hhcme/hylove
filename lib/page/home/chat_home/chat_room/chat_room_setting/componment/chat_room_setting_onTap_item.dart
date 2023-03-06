import 'package:flutter/material.dart';
import 'package:base_widget/base_widget.dart';

class ChatRoomSettingOnTapItemView extends StatelessWidget {
  const ChatRoomSettingOnTapItemView({super.key, required this.onTap, required this.name, this.hasDownLine = true});

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
        child: Container(
          padding: EdgeInsets.only(
            left: screenUtil.adaptive(40),
            right: screenUtil.adaptive(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: screenUtil.adaptive(40), color: Colors.black),
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: screenUtil.adaptive(45),
              )
            ],
          ),
        ),
      ),
    );
  }
}
