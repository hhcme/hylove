import 'dart:ui';

/// 留言信息
class LeavingMessageInfo {
  /// 留言id
  late final int id;

  /// 留言标题
  late final String title;

  /// 留言描述
  late final String description;

  /// 心情
  late final String mood;

  /// 留言人id
  late final int creator;

  /// 接收人id
  late final int receiver;

  /// 创建日期
  late final int createTime;

  /// 过期日期
  late final int expirationTime;

  /// 图片
  late final List<Image> photos;
}
