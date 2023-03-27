import 'package:flutter/material.dart';
import 'package:hylove/component/component.dart';
import 'package:hylove/global/const.dart';
import 'package:hylove/model/chat_model/chat_model.dart';
import 'package:base_widget/base_widget.dart';

class MsgItemView extends StatefulWidget {
  const MsgItemView({required this.msg, super.key, required this.animation});

  final MsgInfo msg;

  final Animation<double> animation;

  @override
  _MsgItemViewState createState() => _MsgItemViewState();
}

class _MsgItemViewState extends State<MsgItemView> with SingleTickerProviderStateMixin {
  /// 总的动画控制器
  late final AnimationController _animationController;

  /// 文本信息框的位置动画
  late final Animation<Offset> _txtOffsetAnimation;

  /// 文本信息框的透明度动画
  late final Animation<double> _txtOpacityAnimation;

  /// 文本信息框的圆角动画
  // late final Animation<double> _txtRadiusAnimation;

  /// 判断是否是自己发的
  bool get isMeSend => widget.msg.sendUserId == userId;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.animation
          // Curves.easeOutBack 是从上往下超过一段距离后回弹
          .drive(CurveTween(curve: Curves.easeOutBack))
          .drive(Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))),
      child: Container(
        margin: EdgeInsets.only(
            left: screenUtil.adaptive(10), right: screenUtil.adaptive(10), bottom: screenUtil.adaptive(20)),
        child: Row(
          mainAxisAlignment: isMeSend ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// 左边自己发信息时显示的头像
            if (!isMeSend)
              Column(
                children: [
                  Container(
                    height: screenUtil.adaptive(90),
                    width: screenUtil.adaptive(90),
                    margin: EdgeInsets.only(left: screenUtil.adaptive(15), right: screenUtil.adaptive(15)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(screenUtil.adaptive(45)),
                      child: Image.asset(
                        'asset/login/touxiang.JPG',
                        width: screenUtil.adaptive(90),
                        height: screenUtil.adaptive(90),
                      ),
                    ),
                  ),
                  Text('何厚聪')
                ],
              ),

            /// 聊天信息框整体
            SlideTransition(
                    position: _txtOffsetAnimation,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (BuildContext context, Widget? child) {
                        return Opacity(
                          opacity: _txtOpacityAnimation.value,
                          child: Stack(
                            children: [
                              /// 小箭头指向(左边)
                              if (!isMeSend)
                                Positioned(
                                    top: screenUtil.adaptive(15),
                                    left: screenUtil.adaptive(-15.5),
                                    child: const RotatedBox(
                                        quarterTurns: 3, child: Icon(Icons.arrow_drop_up, color: Color(0x77FFA0E6)))),

                              /// 聊天的文本/图片信息框
                              PressedMenu(
                                  bigRatio: WidthHeightChangeRatio(width: 1.03, height: 1.15),
                                  smallRatio: WidthHeightChangeRatio(width: 0.97, height: 0.9),
                                  child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minHeight: screenUtil.adaptive(90), maxWidth: screenUtil.adaptive(740)),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: screenUtil.adaptive(20),
                                      right: screenUtil.adaptive(20),
                                      top: screenUtil.adaptive(5),
                                      bottom: screenUtil.adaptive(5),
                                    ),
                                    padding: EdgeInsets.only(
                                      left: screenUtil.adaptive(20),
                                      right: screenUtil.adaptive(20),
                                      top: screenUtil.adaptive(10),
                                      bottom: screenUtil.adaptive(10),
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0x77FFA0E6),
                                      borderRadius: BorderRadius.circular(screenUtil.adaptive(10)),
                                    ),
                                    child: Text(widget.msg.txt,
                                        style: TextStyle(
                                            letterSpacing: screenUtil.adaptive(1.5),
                                            height: screenUtil.adaptive(4),
                                            fontSize: screenUtil.adaptive(40))),
                                  ))),

                              /// 小箭头指向(右边)
                              if (isMeSend)
                                Positioned(
                                    top: screenUtil.adaptive(15),
                                    right: screenUtil.adaptive(-15.5),
                                    child: const RotatedBox(
                                        quarterTurns: 1, child: Icon(Icons.arrow_drop_up, color: Color(0x77FFA0E6)))),
                            ],
                          ),
                        );
                      },
                    )),

            /// 右边自己发的信息时显示的头像
            if (isMeSend)
              Container(
                height: screenUtil.adaptive(90),
                width: screenUtil.adaptive(90),
                margin: EdgeInsets.only(left: screenUtil.adaptive(15), right: screenUtil.adaptive(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenUtil.adaptive(45)),
                  child: Image.asset(
                    'asset/login/touxiang.JPG',
                    width: screenUtil.adaptive(90),
                    height: screenUtil.adaptive(90),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// 初始化文本信息框
  void initShowMsg() async {
    /// 先延迟半秒, 等待头像的动画加载完, 然后才是执行文本信息框的动画
    await Future.delayed(const Duration(milliseconds: 500));

    /// 执行动画
    await _animationController.forward();
  }

  @override
  void initState() {
    _animationController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _txtOffsetAnimation =
        Tween(begin: Offset(isMeSend ? 0.5 : -0.5, 0), end: const Offset(0.0, 0.0)).animate(_animationController);
    _txtOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    // _txtRadiusAnimation = Tween(begin: 40.0, end: 5.0).animate(_animationController);

    //开始动画
    Future.delayed(const Duration(milliseconds: 500)).then((value) => _animationController.forward());
    super.initState();
  }

  @override
  void dispose() {
    /// 销毁动画
    _animationController.dispose();
    super.dispose();
  }
}
