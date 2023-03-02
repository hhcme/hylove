import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_widget/base_widget.dart';
import 'logic.dart';

class NoteHomeView extends GetView<NoteHomeLogic> {
  const NoteHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('note'),
        elevation: screenUtil.adaptive(200),
        actions: [
          ClipRRect(
            key: controller.state.moreGlobalKey,
            borderRadius: BorderRadius.circular(45),
            child: IconButton(
                onPressed: () async {
                  showMenu(
                      context: context,
                      position: const RelativeRect.fromLTRB(100.0, 100, 0.0, 0.0),
                      color: const Color(0xffF0EFF5),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      items: [
                        const PopupMenuItem(value: 'value01', child: Text('写日记')),
                        const PopupMenuItem(value: 'value02', child: Text('悄悄话')),
                      ]);
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(const Color(0x00000000)),
                ),
                icon: SizedBox(
                    width: screenUtil.adaptive(90),
                    height: screenUtil.adaptive(90),
                    child: Icon(
                      Icons.add,
                      color: const Color(0xFFF5B0FF),
                      size: screenUtil.adaptive(90),
                    ))),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: screenUtil.adaptive(20), bottom: screenUtil.adaptive(20)),
            decoration: BoxDecoration(
                // color: Colors.blue,
                border: Border(bottom: BorderSide(width: screenUtil.adaptive(1), color: Colors.grey))),
            child: CalendarTimeline(
              showYears: true,
              initialDate: controller.state.selectedDate,
              firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
              lastDate: DateTime.now().add(const Duration(days: 365 * 9)),
              onDateSelected: (date) => controller.changeDate(date),
              leftMargin: screenUtil.adaptive(20),
              monthColor: Colors.black,
              dayColor: Colors.black,
              dayNameColor: const Color(0xFF333A47),
              activeDayColor: Colors.black,
              activeBackgroundDayColor: const Color(0xFFF5B0FF),
              dotsColor: const Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
            ),
          ),
        ],
      ),
    );
  }
}
