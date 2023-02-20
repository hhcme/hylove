import 'dart:ui';

/// 日记信息
class DiaryInfo {
  /// 日记id
  late final int id;

  /// 日记分组
  late final String group;

  /// 标题
  late final String title;

  /// 日记内容
  late final String description;

  /// 创建日期
  late final int createTime;

  /// 图片
  late final List<Image> photos;

  /// 是否公开
  late final bool isPublic;
}
