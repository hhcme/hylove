import 'package:flutter/cupertino.dart';
import 'package:hy_get/hy_get.dart';
import 'package:hylove/model/model.dart';

class ChatHomeState {
  ChatHomeState();

  final Rx<TextEditingController> textEditingController = TextEditingController().obs;

  final RxBool showDelete = false.obs;
}
