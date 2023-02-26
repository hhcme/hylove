import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/routes/pages.dart';
import 'logic.dart';

class LoginHomeView extends GetView<LoginHomeLogic> {
  const LoginHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF5B0FF),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '登陆页',
          style:
              TextStyle(fontSize: screenUtil.adaptive(50), color: Colors.black, letterSpacing: screenUtil.adaptive(5)),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.REGISTER_USER);
            },
            child: Container(
              alignment: Alignment.center,
              width: screenUtil.adaptive(120),
              margin: EdgeInsets.only(
                right: screenUtil.adaptive(30),
              ),
              child: Text(
                '注册',
                style: TextStyle(
                    color: Colors.black, fontSize: screenUtil.adaptive(40), letterSpacing: screenUtil.adaptive(5)),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          /// 顶部标题
          Container(
            margin: EdgeInsets.only(
              top: screenUtil.adaptive(150),
              bottom: screenUtil.adaptive(150),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenUtil.adaptive(1000),
                  alignment: Alignment.center,
                  child: Text('欢迎登陆',
                      style: TextStyle(
                          fontSize: screenUtil.adaptive(80),
                          fontWeight: FontWeight.w600,
                          letterSpacing: screenUtil.adaptive(10))),
                ),
                Container(
                  width: screenUtil.adaptive(1000),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: screenUtil.adaptive(10),
                  ),
                  child: Text(
                    '希望可以和恋人长长久久！',
                    style: TextStyle(color: Colors.grey, letterSpacing: screenUtil.adaptive(5)),
                  ),
                ),
              ],
            ),
          ),

          /// 登陆输入框
          Column(
            children: [
              SizedBox(
                width: screenUtil.adaptive(800),
                height: screenUtil.adaptive(200),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "账号",
                    hintText: "请输入账号",
                    labelStyle: const TextStyle(color: Color(0xFFF5B0FF)),
                    hintStyle: const TextStyle(color: Color(0xFFF5B0FF)),
                    contentPadding: EdgeInsets.only(
                      left: screenUtil.adaptive(50),
                      right: screenUtil.adaptive(50),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFFF5B0FF), width: screenUtil.adaptive(2)),
                      borderRadius: BorderRadius.circular((screenUtil.adaptive(80))),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFFF5B0FF), width: screenUtil.adaptive(2)),
                      borderRadius: BorderRadius.circular((screenUtil.adaptive(80))),
                    ),
                    prefixIcon: Container(
                      padding: EdgeInsets.only(
                        // left: screenUtil.adaptive(50),
                        left: screenUtil.adaptive(20),
                      ),
                      child: Icon(
                        Icons.person,
                        size: screenUtil.adaptive(60),
                        color: const Color(0xFFF5B0FF),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: screenUtil.adaptive(800),
                height: screenUtil.adaptive(200),
                child: TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请输入密码",
                    labelStyle: const TextStyle(color: Color(0xFFF5B0FF)),
                    hintStyle: const TextStyle(color: Color(0xFFF5B0FF)),
                    contentPadding: EdgeInsets.only(
                      left: screenUtil.adaptive(50),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFFF5B0FF), width: screenUtil.adaptive(2)),
                      borderRadius: BorderRadius.circular((screenUtil.adaptive(80))),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFFF5B0FF), width: screenUtil.adaptive(2)),
                      borderRadius: BorderRadius.circular((screenUtil.adaptive(80))),
                    ),
                    prefixIcon: Container(
                        padding: EdgeInsets.only(
                          left: screenUtil.adaptive(20),
                        ),
                        child: Icon(
                          const IconData(0xe658, fontFamily: 'MyIcons'),
                          size: screenUtil.adaptive(60),
                          color: const Color(0xFFF5B0FF),
                        )),
                  ),
                ),
              )
            ],
          ),

          /// 单选框
          Padding(
            padding: EdgeInsets.only(
              left: screenUtil.adaptive(80),
              right: screenUtil.adaptive(80),
            ),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Obx(() => Checkbox(
                          activeColor: const Color(0xFFF5B0FF),
                          value: controller.state.isAgreement.value,
                          onChanged: (value) {
                            controller.state.isAgreement.toggle();
                          })),
                      Text(
                        '自动登录',
                        style: TextStyle(fontSize: screenUtil.adaptive(40)),
                      )
                    ],
                  ),
                  Text(
                    '忘记密码？',
                    style: TextStyle(fontSize: screenUtil.adaptive(40)),
                  )
                ])
              ],
            ),
          ),

          /// 确认登录
          Container(
            width: screenUtil.adaptive(800),
            height: screenUtil.adaptive(120),
            margin: EdgeInsets.only(
              top: screenUtil.adaptive(20),
              left: screenUtil.adaptive(100),
              right: screenUtil.adaptive(100),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF5B0FF),
              borderRadius: BorderRadius.circular((screenUtil.adaptive(60))),
            ),
            child: ElevatedButton(
              onPressed: () => controller.toLogin(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF5B0FF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((screenUtil.adaptive(60)))),
              ),
              child: Text(
                '登录',
                style: TextStyle(
                    color: Colors.white, fontSize: screenUtil.adaptive(50), letterSpacing: screenUtil.adaptive(20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
