import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteHomeState {
  NoteHomeState();

  ///  右上角 + 号
  final GlobalKey moreGlobalKey = GlobalKey();

  late DateTime selectedDate = DateTime.now();

}
