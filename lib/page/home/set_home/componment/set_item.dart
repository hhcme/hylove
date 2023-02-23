import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_widget/base_widget.dart';

class SetItemView extends StatelessWidget {
  const SetItemView({super.key, required this.onTap, required this.name, this.hasDownLine = true});

  final VoidCallback onTap;

  final String name;

  final bool hasDownLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenUtil.adaptive(120),
      decoration: BoxDecoration(
          border: Border(
              bottom: hasDownLine ? BorderSide(color: Colors.grey, width: screenUtil.adaptive(1)) : BorderSide.none)),
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenUtil.adaptive(0)))),
          overlayColor: MaterialStateProperty.all(const Color(0x55F5B0FF)),
        ),
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
