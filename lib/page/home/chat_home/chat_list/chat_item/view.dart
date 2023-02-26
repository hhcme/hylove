import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/helper/helper.dart';
import 'logic.dart';

class ChatItemView extends StatelessWidget {
  const ChatItemView(this.tag, this.index, {super.key});

  final String tag;

  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatItemLogic(), tag: tag);
    return GestureDetector(
      onTap: () async {
        print(index);
        await ChatRoomHelper.toPersonalRoom(controller.state.userInfo.value!);
      },
      child: Container(
        padding: EdgeInsets.only(
          top: screenUtil.adaptive(20),
          bottom: screenUtil.adaptive(20),
        ),
        decoration:
            BoxDecoration(border: Border(bottom: BorderSide(width: screenUtil.adaptive(1), color: Colors.grey))),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(screenUtil.adaptive(20)),
              child: Obx(() => controller.state.userInfo.value != null
                  ? Image.asset(
                      controller.state.userInfo.value!.avatarUrl,
                      width: screenUtil.adaptive(200),
                      height: screenUtil.adaptive(200),
                    )
                  : Container(
                      width: screenUtil.adaptive(200),
                      height: screenUtil.adaptive(200),
                      decoration: const BoxDecoration(color: Color(0xFFF5B0FF)),
                      child: Icon(
                        const IconData(0xe611, fontFamily: 'MyIcons'),
                        size: screenUtil.adaptive(150),
                        color: Colors.white,
                      ),
                    )),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenUtil.adaptive(600),
                  height: screenUtil.adaptive(200),
                  padding: EdgeInsets.only(
                    top: screenUtil.adaptive(10),
                    left: screenUtil.adaptive(20),
                    right: screenUtil.adaptive(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenUtil.adaptive(60),
                        child: Obx(() => Text(
                              controller.state.userInfo.value!.nickName,
                              style: TextStyle(fontSize: screenUtil.adaptive(40)),
                            )),
                      ),
                      const Text(
                          'hhhhhhhhhhhshhhhhhhhhhhhhhhhshhhhhhhhhhhhhhhhshhhhhhhhhhhhhhhhshhhhhhhhhhhhhhhhshhhhh',
                          maxLines: 2),
                    ],
                  ),
                ),
                const Text('123123')
              ],
            ))
          ],
        ),
      ),
    );
  }
}
