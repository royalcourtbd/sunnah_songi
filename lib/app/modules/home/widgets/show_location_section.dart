import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/common/config/sunnah_screen.dart';
import 'package:sunnah_songi/app/modules/home/controller/home_controller.dart';
import 'package:sunnah_songi/app/static/svg_path.dart';
import 'package:sunnah_songi/app/static/ui_const.dart';

class ShowLocationSection extends StatelessWidget {
  const ShowLocationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: twentyPx,
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 6, top: 16, bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'আসসালামু আলাইকুম',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 60.percentWidth,
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                      ),
                      gapW5,
                      GetBuilder<HomeController>(builder: (controller) {
                        return Text(
                          // 'Banasree, Dhaka,',
                          controller.locationDetails,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
            Image.asset(
              SvgPath.imgMinar,
              width: 90,
              height: 90,
              color: const Color.fromARGB(255, 0, 17, 13),
            ),
          ],
        ),
      ),
    );
  }
}
