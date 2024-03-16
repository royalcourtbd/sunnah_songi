import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/modules/home/controller/home_controller.dart';

import 'package:sunnah_songi/app/static/ui_const.dart';

class FastingTimelineCard extends StatelessWidget {
  const FastingTimelineCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          padding: padding15,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffCEE9E4),
            borderRadius: radius15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'সেহরি শেষ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    // '০৪:১৫ AM',
                    controller.sehriEnd,
                    style: const TextStyle(
                      fontFamily: "Kalpurush",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  color: const Color(0xff049B78),
                  width: 2,
                ),
              ),
               Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'ইফতার শুরু',
                    style: TextStyle(
                      fontFamily: "Kalpurush",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    // '06:১৫ PM',
                    controller.iftartStart,
                    style: const TextStyle(
                      fontFamily: "Kalpurush",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
