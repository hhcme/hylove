import 'package:card_swiper/card_swiper.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/page/home/login_home/register_user/register_user.dart';

class RegisterView extends GetView<RegisterLogic> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F3F3),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '新用户注册',
          style:
              TextStyle(fontSize: screenUtil.adaptive(50), color: Colors.black, letterSpacing: screenUtil.adaptive(5)),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: screenUtil.adaptive(800),
            height: screenUtil.adaptive(200),
            margin: EdgeInsets.only(
              top: screenUtil.adaptive(100),
              bottom: screenUtil.adaptive(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  registerTitle[controller.state.index.value],
                  style: TextStyle(fontSize: screenUtil.adaptive(70)),
                ),
              ),
            ),
          ),
          ExpandablePageView(
            controller: controller.state.pageController,
            children: [
              /// 选择注册方式
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onHorizontalDragStart: (e) {},
                  onHorizontalDragUpdate: (e) {},
                  onHorizontalDragEnd: (e) {},
                  child: Container(
                    width: screenUtil.adaptive(800),
                    height: screenUtil.adaptive(800),
                    margin: EdgeInsets.only(
                      top: screenUtil.adaptive(100),
                      left: screenUtil.adaptive(50),
                      right: screenUtil.adaptive(50),
                    ),
                    child: Row(
                      children: [
                        Column(children: [
                          Padding(
                              padding: EdgeInsets.only(
                                left: screenUtil.adaptive(50),
                                right: screenUtil.adaptive(50),
                              ),
                              child: TextButton(
                                onPressed: () async => controller.jumpPage(appoint: 1),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(150))),
                                  overlayColor: MaterialStateProperty.all(const Color(0x00F5B0FF)),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular((screenUtil.adaptive(150))),
                                  child: SizedBox(
                                      width: screenUtil.adaptive(300),
                                      height: screenUtil.adaptive(300),
                                      child: Icon(
                                        Icons.phone_android,
                                        size: screenUtil.adaptive(180),
                                        color: Colors.black87,
                                      )),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                top: screenUtil.adaptive(50),
                              ),
                              child: const Text('手机号注册')),
                        ]),
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                  left: screenUtil.adaptive(50),
                                  right: screenUtil.adaptive(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular((screenUtil.adaptive(150))),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(150))),
                                      // side: MaterialStateProperty.all(
                                      //     BorderSide(color: const Color(0xFFF5B0FF), width: screenUtil.adaptive(1))),
                                      overlayColor: MaterialStateProperty.all(const Color(0x00F5B0FF)),
                                    ),
                                    child: SizedBox(
                                        width: screenUtil.adaptive(300),
                                        height: screenUtil.adaptive(300),
                                        child: Icon(
                                          const IconData(0xe607, fontFamily: 'MyIcons'),
                                          size: screenUtil.adaptive(200),
                                          // color: const Color(0xFFF5B0FF),
                                          color: Colors.green,
                                        )),
                                  ),
                                )),
                            Container(
                                margin: EdgeInsets.only(
                                  top: screenUtil.adaptive(50),
                                ),
                                child: const Text('微信注册')),
                          ],
                        ),
                      ],
                    ),
                  )),

              /// 第一个页面是手机号
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onHorizontalDragStart: (e) {},
                  onHorizontalDragUpdate: (e) {},
                  onHorizontalDragEnd: (e) {},
                  child: Container(
                    width: screenUtil.adaptive(800),
                    height: screenUtil.adaptive(800),
                    margin: EdgeInsets.only(
                      left: screenUtil.adaptive(100),
                      right: screenUtil.adaptive(100),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.black45,
                          maxLength: 11,
                          style: TextStyle(fontSize: screenUtil.adaptive(50)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            counterText: '',
                            hintText: "请输入手机号",
                            contentPadding: EdgeInsets.only(
                              left: screenUtil.adaptive(50),
                              right: screenUtil.adaptive(50),
                              top: screenUtil.adaptive(50),
                              bottom: screenUtil.adaptive(50),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular((screenUtil.adaptive(20))),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular((screenUtil.adaptive(20))),
                            ),
                            suffixIcon: Container(
                              padding: EdgeInsets.only(
                                right: screenUtil.adaptive(20),
                              ),
                              child: Icon(
                                Icons.phone_android,
                                size: screenUtil.adaptive(80),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: screenUtil.adaptive(800),
                          height: screenUtil.adaptive(160),
                          margin: EdgeInsets.only(
                            top: screenUtil.adaptive(50),
                            bottom: screenUtil.adaptive(50),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular((screenUtil.adaptive(20)))),
                          child: Row(
                            children: [
                              Container(
                                width: screenUtil.adaptive(550),
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  cursorColor: Colors.black45,
                                  maxLength: 6,
                                  style: TextStyle(fontSize: screenUtil.adaptive(50)),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    counterText: '',
                                    hintText: "请输入验证码",
                                    contentPadding: EdgeInsets.only(
                                      left: screenUtil.adaptive(50),
                                      right: screenUtil.adaptive(50),
                                      top: screenUtil.adaptive(50),
                                      bottom: screenUtil.adaptive(50),
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular((screenUtil.adaptive(20))),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular((screenUtil.adaptive(20))),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  width: screenUtil.adaptive(250),
                                  padding: EdgeInsets.only(
                                    top: screenUtil.adaptive(20),
                                    bottom: screenUtil.adaptive(20),
                                    left: screenUtil.adaptive(20),
                                    right: screenUtil.adaptive(20),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(screenUtil.adaptive(20)))),
                                      side: MaterialStateProperty.all(
                                          BorderSide(color: const Color(0xFFF5B0FF), width: screenUtil.adaptive(1))),
                                      overlayColor: MaterialStateProperty.all(const Color(0x55F5B0FF)),
                                    ),
                                    child: Text('获取验证码',
                                        style: TextStyle(
                                          fontSize: screenUtil.adaptive(32),
                                        )),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),

              /// 第二个页面是设置密码
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onHorizontalDragStart: (e) {},
                  onHorizontalDragUpdate: (e) {},
                  onHorizontalDragEnd: (e) {},
                  child: Container(
                    width: screenUtil.adaptive(800),
                    height: screenUtil.adaptive(800),
                    margin: EdgeInsets.only(
                      left: screenUtil.adaptive(100),
                      right: screenUtil.adaptive(100),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: screenUtil.adaptive(150),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.black45,
                            maxLength: 15,
                            obscureText: true,
                            style: TextStyle(fontSize: screenUtil.adaptive(50)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              counterText: '',
                              hintText: "请输入密码",
                              contentPadding: EdgeInsets.only(
                                left: screenUtil.adaptive(50),
                                right: screenUtil.adaptive(50),
                                top: screenUtil.adaptive(50),
                                bottom: screenUtil.adaptive(50),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular((screenUtil.adaptive(20))),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular((screenUtil.adaptive(20))),
                              ),
                              suffixIcon: Container(
                                padding: EdgeInsets.only(
                                  right: screenUtil.adaptive(20),
                                ),
                                child: Icon(
                                  Icons.remove_red_eye,
                                  size: screenUtil.adaptive(80),
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: screenUtil.adaptive(800),
                          height: screenUtil.adaptive(150),
                          margin: EdgeInsets.only(
                            top: screenUtil.adaptive(50),
                            bottom: screenUtil.adaptive(50),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.black45,
                            maxLength: 15,
                            obscureText: true,
                            style: TextStyle(fontSize: screenUtil.adaptive(50)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              counterText: '',
                              hintText: "请再次输入密码",
                              contentPadding: EdgeInsets.only(
                                left: screenUtil.adaptive(50),
                                right: screenUtil.adaptive(50),
                                top: screenUtil.adaptive(50),
                                bottom: screenUtil.adaptive(50),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular((screenUtil.adaptive(20))),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular((screenUtil.adaptive(20))),
                              ),
                              suffixIcon: Container(
                                padding: EdgeInsets.only(
                                  right: screenUtil.adaptive(20),
                                ),
                                child: Icon(
                                  Icons.remove_red_eye,
                                  size: screenUtil.adaptive(80),
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),

              /// 第三个页面是头像昵称等信息
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onHorizontalDragStart: (e) {},
                  onHorizontalDragUpdate: (e) {},
                  onHorizontalDragEnd: (e) {},
                  child: Container(
                    width: screenUtil.adaptive(800),
                    height: screenUtil.adaptive(800),
                    margin: EdgeInsets.only(
                      left: screenUtil.adaptive(100),
                      right: screenUtil.adaptive(100),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            bottom: screenUtil.adaptive(100),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                                overlayColor: MaterialStateProperty.all(const Color(0x44F5B0FF)),
                                backgroundColor: MaterialStateProperty.all(Colors.black12),
                              ),
                              child: Container(
                                  width: screenUtil.adaptive(200),
                                  height: screenUtil.adaptive(200),
                                  child: Icon(
                                    Icons.person,
                                    size: screenUtil.adaptive(150),
                                    color: const Color(0xFFF5B0FF),
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          height: screenUtil.adaptive(150),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.black45,
                            maxLength: 15,
                            obscureText: true,
                            style: TextStyle(fontSize: screenUtil.adaptive(50)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              counterText: '',
                              hintText: "请输入昵称",
                              contentPadding: EdgeInsets.only(
                                left: screenUtil.adaptive(50),
                                right: screenUtil.adaptive(50),
                                top: screenUtil.adaptive(50),
                                bottom: screenUtil.adaptive(50),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular((screenUtil.adaptive(20))),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular((screenUtil.adaptive(20))),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: screenUtil.adaptive(800),
                          height: screenUtil.adaptive(150),
                          margin: EdgeInsets.only(
                            top: screenUtil.adaptive(50),
                            bottom: screenUtil.adaptive(50),
                          ),
                          child: const Text('选择性别'),
                        ),
                      ],
                    ),
                  )),

              /// 第四个页面是一些选填信息
              // GestureDetector(
              //     behavior: HitTestBehavior.opaque,
              //     onHorizontalDragStart: (e) {},
              //     onHorizontalDragUpdate: (e) {},
              //     onHorizontalDragEnd: (e) {},
              //     child: ExamplePage(
              //       "3",
              //       Colors.red,
              //     )),

              /// 第五个页面是注册成功的页面
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onHorizontalDragStart: (e) {},
                  onHorizontalDragUpdate: (e) {},
                  onHorizontalDragEnd: (e) {},
                  child: Container(
                    width: screenUtil.adaptive(800),
                    height: screenUtil.adaptive(800),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            width: screenUtil.adaptive(300),
                            height: screenUtil.adaptive(300),
                            margin: EdgeInsets.only(
                              top: screenUtil.adaptive(100),
                            ),
                            child: Icon(
                              Icons.check_circle,
                              size: screenUtil.adaptive(300),
                              color: const Color(0xFFF5B0FF),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Obx(() => Visibility(
              visible: controller.state.index.value >= 1,
              child: TextButton(
                  onPressed: () => controller.jumpPage(),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(150))),
                    side: MaterialStateProperty.all(
                        BorderSide(color: const Color(0xFFF5B0FF), width: screenUtil.adaptive(1))),
                    overlayColor: MaterialStateProperty.all(const Color(0x44F5B0FF)),
                    backgroundColor: MaterialStateProperty.all(const Color(0xFFF5B0FF)),
                  ),
                  child: Container(
                    width: screenUtil.adaptive(800),
                    height: screenUtil.adaptive(100),
                    child: Center(
                      child: Text(controller.state.index.value != 4 ? '下一步' : '前往登录',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenUtil.adaptive(50),
                              letterSpacing: screenUtil.adaptive(10))),
                    ),
                  ))))
        ],
      ),
    );
  }
}

class ExamplePage extends StatelessWidget {
  ExamplePage(this.txt, this.color);

  final String txt;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenUtil.adaptive(800),
      height: screenUtil.adaptive(800),
      child: Center(
        child: Text(txt),
      ),
    );
  }
}
