import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hylove/data/data.dart';
import 'package:hylove/page/home/app_home/app_home.dart';
import 'package:hy_get/hy_get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/page/home/chat_home/chat_room/chat_room.dart';
import 'package:hylove/page/middle_control/middle_control.dart';
import 'package:hylove/routes/pages.dart';

void main() async {
  await GetStorage.init();
  AllData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        try {
          final MiddleControlLogic middle = Get.find<MiddleControlLogic>();
          final ChatRoomLogic chatRoomLogic = Get.find<ChatRoomLogic>();

          middle.listenFocusNode();
          chatRoomLogic.hideChatTool();
        } catch (e, stack) {
          print(e);
        }
        print('全局失去焦点');
      },
      child: GetMaterialApp(
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context),
            child: ScreenWidget(
              child: child,
            ),
          );
        },
        home: LogicWrap(getInstance: () => AppHomeLogic(), child: const AppHomeView()),
        initialRoute: '/',
        getPages: AppPages.routes,
        transitionDuration: const Duration(milliseconds: 500),
        theme: ThemeData(
          useMaterial3: true,
          // colorSchemeSeed: const Color(0xFFF5B0FF),
        ),
      ),
    );
  }
}
