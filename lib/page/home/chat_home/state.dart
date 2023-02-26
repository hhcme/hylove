import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hylove/model/model.dart';

class ChatHomeState {
  ChatHomeState();

  final Rx<TextEditingController> textEditingController = TextEditingController().obs;

  final RxBool showDelete= false.obs;


}
