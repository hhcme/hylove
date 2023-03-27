import 'package:base_widget/base_widget.dart';
import 'package:flutter/material.dart';

class PopMenu extends StatefulWidget {
  const PopMenu({super.key, this.child});

  final Widget? child;

  @override
  _PopMenuState createState() => _PopMenuState();
}

class _PopMenuState extends State<PopMenu> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenUtil.adaptive(800),
      child: Center(
        child: Stack(
          children: [
            Container(
              width: screenUtil.adaptive(450),
              height: screenUtil.adaptive(100),
              decoration: BoxDecoration(
                  color: const Color(0xff262626), borderRadius: BorderRadius.circular(screenUtil.adaptive(10))),
            ),
            Container(
              margin: EdgeInsets.only(
                top: screenUtil.adaptive(65),
                left: screenUtil.adaptive(180),
              ),
              child: RotatedBox(quarterTurns: 2, child: Icon(Icons.arrow_drop_up, size: screenUtil.adaptive(80), color: const Color(0xff262626))),
            )
          ],
        ),
      ),
    );
  }
}
