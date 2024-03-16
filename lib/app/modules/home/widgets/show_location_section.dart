import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
        padding: const EdgeInsets.all(5),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Colors.grey[200]!,
              offset: const Offset(00, 02)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            gapW12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'আসসালামু আলাইকুম',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Kalpurush",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 60.percentWidth,
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                      ),
                      gapW5,
                      GetBuilder<HomeController>(builder: (controller) {
                        return Text(
                          controller.locationDetails,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontFamily: "Roboto",
                            fontSize: 14,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),

            Flexible(
              child: SizedBox(
                // height: 60, width: 60,
                child: Lottie.asset("assets/animation/home_animation1.json"),
                // child: Lottie.asset("assets/animation/home_animation.json"),
              ),
            )
            // Image.asset(
            //   SvgPath.imgMinar,
            //   width: 60,
            //   height: 60,
            //   color: const Color.fromARGB(255, 0, 17, 13),
            // ),
          ],
        ),
      ),
    );
  }
}
