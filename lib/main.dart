import 'package:flutter/material.dart';
import 'package:hylove/data/data.dart';
import 'package:hylove/page/home/app_home/app_home.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hylove/page/middle_control/middle_control.dart';
import 'package:hylove/routes/pages.dart';

void main() {
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
        try{
          final MiddleControlLogic middle = Get.find<MiddleControlLogic>();
          middle.listenFocusNode();
        }catch(e,stack){
          print(e);
        }
        print('全局失去焦点');
      },
      child: GetMaterialApp(
        home: ScreenWidget(
          child: LogicWrap(getInstance: () => AppHomeLogic(), child: const AppHomeView()),
        ),
        initialRoute: '/',
        getPages: AppPages.routes,
        theme: ThemeData(
          useMaterial3: true,
          // colorSchemeSeed: const Color(0xFFF5B0FF),
        ),
      ),
    );
  }
}
