import 'package:get/get.dart';

import 'state.dart';

class NoteHomeLogic extends GetxController {
  final NoteHomeState state = NoteHomeState();

  /// 修改日期后的回调
  void changeDate(DateTime date) async {
    state.selectedDate = date;
  }
}
