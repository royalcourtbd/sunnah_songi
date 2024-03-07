import 'package:flutter/material.dart';
import 'package:sunnah_songi/app/modules/home/widgets/prayer_time_list_item.dart';

import 'package:sunnah_songi/app/static/ui_const.dart';

class PrayerTimeListCard extends StatelessWidget {
  const PrayerTimeListCard({
    super.key,
    required this.prayerTimesInBangla,
  });

  final List<Map<String, String>> prayerTimesInBangla;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding10,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffCEE9E4),
        borderRadius: radius15,
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: prayerTimesInBangla.length,
        itemBuilder: (context, index) {
          return PrayerTimeListItem(
              prayerTimesInBangla: prayerTimesInBangla, index: index);
        },
      ),
    );
  }
}
