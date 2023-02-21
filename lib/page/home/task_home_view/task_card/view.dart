import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:base_widget/base_widget.dart';
import 'logic.dart';

class TaskCardView extends GetView<TaskCardLogic> {
  const TaskCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      surfaceTintColor: Colors.white,
      child: SizedBox(
          child: Container(
        height: screenUtil.adaptive(250),
        padding: EdgeInsets.all(
          screenUtil.adaptive(30),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [Text('任务1')],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [Text('miaoshu')],
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
