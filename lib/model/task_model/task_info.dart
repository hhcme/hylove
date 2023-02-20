import 'dart:ui';

/// 任务信息
class TaskInfo {
  /// 任务id
  late final int id;

  /// 任务分组
  late final String group;

  /// 标题
  late final String title;

  /// 任务描述
  late final String description;

  /// 创建者
  late final int creator;

  /// 完成者
  late final int completer;

  /// 创建日期
  late final int createTime;

  /// 完成日期
  late final int completeTime;

  /// 完成周期
  late final int cycle;

  /// 完成次数
  late final int frequency;

  /// 图片
  late final List<Image> photos;
}
