import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:base_widget/base_widget.dart';
import 'logic.dart';

class TaskListView extends GetView<TaskListLogic> {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupedListView<dynamic, String>(
      shrinkWrap: true,
      elements: controller.state.itemList,
      groupBy: (element) => element['group'], // 可以对列表里的数据进行一点归类
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']),
      // order: GroupedListOrder.DESC,
      // useStickyGroupSeparators: true,
      groupSeparatorBuilder: (String value) => Container(),
      itemBuilder: (c, element) {
        return Card(
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          surfaceTintColor: Colors.white,
          child: SizedBox(
              child: Container(
            height: screenUtil.adaptive(250),
            margin: EdgeInsets.only(
              right: screenUtil.adaptive(30),
            ),
            child: Column(
              children: [
                Row(
                  children: [Text('任务1')],
                ),
                Row(
                  children: [Text('miaoshu')],
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
