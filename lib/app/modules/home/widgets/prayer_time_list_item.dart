import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/modules/home/controller/home_controller.dart';
import 'package:sunnah_songi/app/static/ui_const.dart';

class PrayerTimeListItem extends StatelessWidget {
  const PrayerTimeListItem({
    super.key,
    required this.prayerTimesInBangla,
    required this.index,
  });

  final List<Map<String, String>> prayerTimesInBangla;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        // color: index == 4 ? const Color(0xff0E9F7E) : Colors.transparent,
        color: prayerTimesInBangla[index]['name'] == Get.find<HomeController>().currentPrayerName ? const Color(0xff0E9F7E) : Colors.transparent,
        borderRadius: radius20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${prayerTimesInBangla[index]['name']}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '${prayerTimesInBangla[index]['range']}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
