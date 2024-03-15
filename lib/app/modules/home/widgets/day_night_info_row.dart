import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/common/utils/string_converter.dart';
import 'package:sunnah_songi/app/modules/home/controller/home_controller.dart';
import 'package:sunnah_songi/app/static/svg_path.dart';

class DayNightInfoRow extends StatelessWidget {
  const DayNightInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  SvgPath.icSun,
                  width: 40,
                  height: 40,
                ),
                 Text(
                  convertTimeToBangla(controller.sunRise),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'সূর্যদয়',
                  style: TextStyle(
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
              children: [
                Image.asset(
                  SvgPath.icSun,
                  width: 40,
                  height: 40,
                ),
                 Text(
                  convertTimeToBangla(controller.sunSet),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'সূর্যাস্ত',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        );
      }
    );
  }
}
