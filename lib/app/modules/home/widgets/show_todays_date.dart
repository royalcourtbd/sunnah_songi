import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/modules/home/controller/home_controller.dart';

class ShowTodaysDate extends StatelessWidget {
  const ShowTodaysDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder<HomeController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // '25 Shaaban, 1445',
                    controller.arabicDate,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text(
                    // 'বুধ, ১২ মে, ২০২৪'
                    controller.banglaDate
                    ),
                ],
              );
            }
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ],
      ),
    );
  }
}
