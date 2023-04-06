import 'package:flutter/material.dart';
import 'package:hy_get/hy_get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hylove/page/home/task_home_view/task_card/task_card.dart';

import 'logic.dart';

class TaskHomeView extends GetView<TaskHomeLogic> {
  const TaskHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (BuildContext context, child) {
        return Scaffold(
            body: Container(
          padding: EdgeInsets.all(
            screenUtil.adaptive(40),
          ),
          decoration: const BoxDecoration(color: Color(0xffF0EFF5)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// 顶部留白
                Container(
                  height: screenUtil.adaptive(80),
                ),

                /// 顶部标题
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(screenUtil.adaptive(30)),
                        child: Container(
                          width: screenUtil.adaptive(900),
                          height: controller.state.height.value,
                          padding: EdgeInsets.only(
                            top: screenUtil.adaptive(30),
                            bottom: screenUtil.adaptive(30),
                            left: screenUtil.adaptive(50),
                            right: screenUtil.adaptive(50),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(screenUtil.adaptive(20)),
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    child: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.keyboard_backspace_rounded),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      height: screenUtil.adaptive(70),
                                      margin: EdgeInsets.only(
                                        top: screenUtil.adaptive(20),
                                        bottom: screenUtil.adaptive(20),
                                      ),
                                      child: const Text(
                                        '任务',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: screenUtil.adaptive(2),
                                decoration: const BoxDecoration(color: Color(0xffF0EFF5)),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                    top: screenUtil.adaptive(20),
                                    bottom: screenUtil.adaptive(20),
                                  ),
                                  child: Row(
                                    children: [
                                      /// 这里应该有显示当日进度的进度条
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('今日进度'),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    width: screenUtil.adaptive(650),
                                                    height: screenUtil.adaptive(20),
                                                    margin: EdgeInsets.only(
                                                      top: screenUtil.adaptive(2),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: screenUtil.adaptive(650),
                                                    height: screenUtil.adaptive(20),
                                                    margin: EdgeInsets.only(
                                                      top: screenUtil.adaptive(2),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: const Color(0x77F5B0FF),
                                                        borderRadius: BorderRadius.circular(screenUtil.adaptive(10))),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                width: screenUtil.adaptive(100),
                                                margin: EdgeInsets.only(
                                                  left: screenUtil.adaptive(50),
                                                ),
                                                child: const Text('100%'),
                                              )
                                            ],
                                          ),
                                        ],
                                      )

                                      /// 有一个展开详情的选项
                                      /// 点击可以展开总进度或者总任务数完成的次数等信息
                                    ],
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      if (controller.state.isShowStatus) {
                                        controller.state.isShowStatus = false;
                                        await controller.hide();
                                      } else {
                                        await controller.show();
                                        controller.state.isShowStatus = true;
                                      }
                                    },
                                    child: const Text(
                                      '查看更多',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Transform.rotate(
                                      angle: controller.state.transform.value, child: const Icon(Icons.arrow_drop_down))
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),

                /// 选项卡
                GroupedListView<dynamic, String>(
                  shrinkWrap: true,
                  elements: controller.state.elements,
                  groupBy: (element) => element.group, // 可以对列表里的数据进行一点归类
                  // groupComparator: (value1, value2) => value2.compareTo(value1),
                  // itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']),
                  // order: GroupedListOrder.DESC,
                  // useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (String value) => Container(),
                  itemBuilder: (c, element) {
                    return LogicWrap(
                        getInstance: () => TaskCardLogic(TaskCardState(element)), child:  const TaskCardView());
                  },
                ),
              ],
            ),
          ),
        ));
      },
      animation: controller.animationController,
    );
  }
}
