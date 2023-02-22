import 'dart:ui';

/// 任务信息
class TaskInfo {
  /// 任务id
  final int id = 0;

  /// 任务分组
  final String group = 'one';

  /// 标题
  final String title = '每天都要喝水';

  /// 任务描述
  final String description = '喝水有奖励，不喝水要扣分';

  /// 创建者
  final int creator = 0;

  /// 完成者
  final int completer = 1;

  /// 创建日期
  final int createTime = 0;

  /// 完成日期
  final int completeTime = 0;

  /// 完成周期
  final int cycle = 0;

  /// 完成次数
  final int frequency = 0;

  /// 完成加分
  final int addPoints = 1;

  /// 图片
  final List<Image> photos = [];
}
