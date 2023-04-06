import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:base_widget/base_widget.dart';
import 'package:hy_get/hy_get.dart';

import 'logic.dart';

class PhotoHomeView extends GetView<PhotoHomeLogic> {
  const PhotoHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screenUtil.adaptive(900),
        height: screenUtil.adaptive(900),
        child: Center(
            child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              "asset/login/touxiang.JPG",
            );
          },
          itemCount: 10,
          itemWidth: 300.0,
          layout: SwiperLayout.STACK,
        )
            // Swiper(
            //   itemBuilder: (context, index) {
            //     return Container(
            //       width: screenUtil.adaptive(800),
            //       height: screenUtil.adaptive(800),
            //       decoration: BoxDecoration(color: Colors.grey),
            //       child: const Text('123123123'),
            //     );
            //   },
            //   indicatorLayout: PageIndicatorLayout.COLOR,
            //   autoplay: true,
            //   itemCount: 3,
            //   pagination: const SwiperPagination(),
            //   control: const SwiperControl(),
            // ),
            ),
      ),
    );
  }
}
