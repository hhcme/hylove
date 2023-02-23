import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/page/home/set_home/componment/set_item.dart';
import 'logic.dart';

class SetHomeView extends GetView<SetHomeLogic> {
  const SetHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        backgroundColor: const Color(0xFFF0EFF5),
      ),
      backgroundColor: const Color(0xFFF0EFF5),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: screenUtil.adaptive(30),
              bottom: screenUtil.adaptive(30),
              left: screenUtil.adaptive(50),
              right: screenUtil.adaptive(50),
            ),
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(screenUtil.adaptive(40))),
            child: Column(
              children: [
                SetItemView(onTap: () {}, name: '账号资料'),
                SetItemView(onTap: () {}, name: '消息通知'),
                SetItemView(onTap: () {}, name: '权限详情'),
                SetItemView(onTap: () {}, name: '账号资料'),
                SetItemView(onTap: () {}, name: '意见反馈'),
                SetItemView(
                  onTap: () {},
                  name: '关于我们',
                  hasDownLine: false,
                ),
              ],
            ),
          ),
          Container(
              height: screenUtil.adaptive(150),
              margin: EdgeInsets.only(
                top: screenUtil.adaptive(40),
                left: screenUtil.adaptive(50),
                right: screenUtil.adaptive(50),
              ),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.all(const Color(0x55F5B0FF)),
                ),
                child: SizedBox(
                  width: screenUtil.adaptive(900),
                  height: screenUtil.adaptive(150),
                  child: Center(
                    child: Text(
                      '退出登录',
                      style: TextStyle(color: Colors.red, fontSize: screenUtil.adaptive(45)),
                    ),
                  ),
                ),
              ))
        ],
      ),

      /*
      * 账号资料
      * 消息通知
      * 权限详情
      * 一件反馈
      * 关于我们
      * 推出登录
      *
      * */
    );
  }
}
