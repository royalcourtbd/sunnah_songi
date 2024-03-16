import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/common/config/sunnah_screen.dart';
import 'package:sunnah_songi/app/modules/home/controller/home_controller.dart';

class ShowTodaysDate extends StatelessWidget {
  const ShowTodaysDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: twentyPx,
      ),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<HomeController>(builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      // '25 Shaaban, 1445',
                      controller.arabicDate,
                      style: const TextStyle(
                            // fontFamily: "Roboto",
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                      // 'বুধ, ১২ মে, ২০২৪'
                      controller.banglaDate,
                      style: const TextStyle(
                        fontFamily: "Kalpurush"
                      ),
                      ),
                ],
              );
            }),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
