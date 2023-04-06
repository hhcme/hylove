import 'package:flutter/material.dart';
import 'package:hy_get/hy_get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/model/model.dart';
import 'logic.dart';
import 'state.dart';

class TaskCardView extends GetView<TaskCardLogic> {
  const TaskCardView( {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      surfaceTintColor: Colors.white,
      child: SizedBox(
          child: Container(
        padding: EdgeInsets.only(
          top: screenUtil.adaptive(30),
          bottom: screenUtil.adaptive(30),
          left: screenUtil.adaptive(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      controller.state.taskInfo.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: screenUtil.adaptive(45)),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenUtil.adaptive(620),
                      child: Text(
                        controller.state.taskInfo.description,
                        style: TextStyle(fontSize: screenUtil.adaptive(35)),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '加分: ${controller.state.taskInfo.addPoints}',
                      style: TextStyle(fontSize: screenUtil.adaptive(35)),
                    )
                  ],
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                overlayColor: MaterialStateProperty.all(const Color(0x00FFFFFF)),
              ),
              child: SizedBox(
                  width: screenUtil.adaptive(100),
                  height: screenUtil.adaptive(100),
                  child: Icon(
                    Icons.check_circle,
                    size: screenUtil.adaptive(100),
                    color: const Color(0xFFF5B0FF),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
