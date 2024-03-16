import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/common/utils/string_converter.dart';
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
    bool isSelected =  prayerTimesInBangla[index]['name'] == Get.find<HomeController>().currentPrayerName;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        // color: index == 4 ? const Color(0xff0E9F7E) : Colors.transparent,
        color: isSelected? const Color(0xff0E9F7E) : Colors.transparent,
        borderRadius: radius20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${prayerTimesInBangla[index]['name']}',
            style:  TextStyle(
              color: isSelected? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            convertTimeToBangla(prayerTimesInBangla[index]['range']!),
            style:  TextStyle(
               color: isSelected? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
