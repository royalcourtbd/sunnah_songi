import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/modules/home/controller/home_controller.dart';
import 'package:sunnah_songi/app/modules/home/widgets/day_night_info_row.dart';
import 'package:sunnah_songi/app/modules/home/widgets/fasting_timeline_card.dart';
import 'package:sunnah_songi/app/modules/home/widgets/prayer_time_list_card.dart';
import 'package:sunnah_songi/app/static/ui_const.dart';

class DailySalatInfo extends StatelessWidget {
  const DailySalatInfo({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          padding: padding15,
          decoration: BoxDecoration(
            color: const Color(0xffE5F1F1),
            borderRadius: radius15,
          ),
          child: Column(
            children: [
              const Text(
                'এশা',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff049B78),
                ),
              ),
              const Text(
                '০৭:১৯ - ০১:২০',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              gapH10,
              const DayNightInfoRow(),
              gapH10,
              PrayerTimeListCard(prayerTimesInBangla: controller.prayerTimesInBangla),
              gapH10,
              const FastingTimelineCard(),
            ],
          ),
        );
      }
    );
  }
}
