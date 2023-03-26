/// 聊天显示在聊天界面中间的信息框的信息
class MsgInfo {
  MsgInfo(this.txt, {this.sendUserId = 0});

  // /// 发送人
  final int sendUserId;

  ///

  /// at信息
  // final int atUser;

  /// 引用信息
  // final MsgInfo? replyMsg;

  /// 文本信息
  String txt = '';
}
