import 'dart:math';
import 'dart:ui';
import 'dart:async';
import 'package:base_widget/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:hylove/component/menu_widget/pop_menu.dart';

class PressedMenu extends StatefulWidget {
  PressedMenu({super.key, required this.child, WidthHeightChangeRatio? bigRatio, WidthHeightChangeRatio? smallRatio}) {
    this.bigRatio = bigRatio ?? WidthHeightChangeRatio();
    this.smallRatio = smallRatio ?? WidthHeightChangeRatio();
  }

  final Widget child;

  /// 放大比例
  late final WidthHeightChangeRatio bigRatio;

  /// 缩小比例
  late final WidthHeightChangeRatio smallRatio;

  @override
  _PressedMenuState createState() => _PressedMenuState();
}

class _PressedMenuState extends State<PressedMenu> with SingleTickerProviderStateMixin {
  /// 基础的宽高放大比例
  double? width;
  double? height;

  /// 原始的尺寸
  Size? oldSize;

  /// 是否触发长按后放大
  bool isOnPressed = false;

  /// 整体的焦点
  final FocusNode focusNode = FocusNode();

  final GlobalKey globalKey = GlobalKey();

  Timer? _timer;

  /// 长按弹窗
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: () {},
        onLongPressStart: (e) => _pressedStart(),
        onLongPressEnd: (e) => _pressedEnd(),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          key: globalKey,
          // curve: isOnPressed ? Curves.fastOutSlowIn : Curves.easeOutQuart,
          curve: Curves.fastOutSlowIn,
          width: width,
          height: height,
          duration: const Duration(milliseconds: 250),
          child: widget.child,
        ),
      ),
    );
  }

  /// 长按开始的缩小动画
  void _pressedStart() async {
    print('开始缩小');
    // 只有无变化或者更小的时候才会触发, 已经放大时不会触发
    if (oldSize == null) {
      oldSize = getSize;
      width = oldSize!.width;
      height = oldSize!.height;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 50));
    }

    if (isOnPressed) {
      return;
    }
    FocusScope.of(context).requestFocus(focusNode);

    setState(() {});
    width = oldSize!.width * widget.smallRatio.width;
    height = oldSize!.height * widget.smallRatio.height;
    setState(() {});
    if (_timer != null) {
      return;
    }
    _timer = Timer(const Duration(milliseconds: 400), () {
      _timer?.cancel();
      _timer = null;
      _pressedEnd();
    });
  }

  /// 长按结束, 长按超过一定时间, 放大动画
  void _pressedEnd() {
    print('开始放大');
    if (isOnPressed) {
      return;
    }
    isOnPressed = true;
    width = oldSize!.width * widget.bigRatio.width;
    height = oldSize!.height * widget.bigRatio.height;
    setState(() {});
    pushPopMenu();
  }

  /// 取消放大效果
  void _pressedDispose() {
    print('恢复原状');
    width = oldSize!.width;
    height = oldSize!.height;
    isOnPressed = false;
    setState(() {});
    deletePopMenu();
  }

  Size get getSize {
    final RenderBox renderBox = globalKey.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size;
  }

  Offset get getOffset {
    final RenderBox renderBox = globalKey.currentContext!.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero);
  }

  /// 推长按弹窗
  void pushPopMenu() {
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        left: getOffset.dx + (getSize.width / 2) - screenUtil.adaptive(400),
        top: getOffset.dy - screenUtil.adaptive(125),
        child: const PopMenu(),
      );
    });
    Overlay.of(context)?.insert(overlayEntry!);
  }

  /// 删除长按弹窗
  void deletePopMenu() {
    overlayEntry?.remove();
    overlayEntry?.dispose();
    overlayEntry = null;
  }

  @override
  void initState() {
    super.initState();

    /// 添加焦点监听, 点击外部的时候可以恢复原来的形状
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        _pressedDispose();
      }
    });
  }

  @override
  void dispose() {
    /// 销毁监听
    focusNode.dispose();
    super.dispose();
  }
}

/// 宽高变化比例
/// 均默认为 1.0, 不传时无变化
class WidthHeightChangeRatio {
  WidthHeightChangeRatio({this.width = 1.0, this.height = 1.0});

  final double width;

  final double height;
}
