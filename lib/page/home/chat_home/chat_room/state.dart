import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hylove/model/model.dart';

class ChatRoomState {
  ChatRoomState();

  final Rx<UserInfo?> userInfo = Rx(null);

  final TextEditingController textEditingController = TextEditingController();

  /// 信息列表
  final Rx<List<MsgInfo>> itemList = Rx([]);

  /// 滚动列表的 key
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  /// 滚动列表的控制器(带动画)
  final ScrollController scrollController = ScrollController();

  /// 当前的展开状态
  bool isShowStatus = false;

  /// 输入文字模式
  final RxBool isInput = true.obs;

  /// 显示发送按钮
  final RxBool showSend = false.obs;

  /// 输入框外壳的高度
  late final Animation<double> boxHeight;

  /// 输入框外壳的焦点
  final FocusNode inputFocusNode = FocusNode();
}
