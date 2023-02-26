import 'package:get/get.dart';
import 'package:hylove/routes/pages.dart';

import 'state.dart';

class LoginHomeLogic extends GetxController {
  final LoginHomeState state = LoginHomeState();

  ///
  Future<void> toLogin() async {
    ///

    Get.until((route) => route.settings.name == Routes.APP_HOME || route.settings.name == '/');
  }
}
