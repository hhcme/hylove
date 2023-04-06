import 'package:hy_get/hy_get.dart';
import 'package:hylove/routes/pages.dart';

import 'state.dart';

class LoginHomeLogic extends GetxController {
  final LoginHomeState state = LoginHomeState();

  ///
  Future<void> toLogin() async {
    ///

    Get.until((route) => route.name == Routes.APP_HOME || route.name == '/');
  }
}
