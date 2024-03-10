import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/config/sunnah_screen.dart';
import 'package:sunnah_songi/app/modules/home/controller/home_controller.dart';
import 'package:sunnah_songi/app/static/svg_path.dart';
import 'package:sunnah_songi/app/static/ui_const.dart';

class ShowLocationSection extends StatelessWidget {
   ShowLocationSection({
    super.key,
  });

  late HomeController _homeController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 6, top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: GradientRotation(0.5),
          stops: [0.0, 1.0],
          colors: [
            Color(0xff049B78),
            Color(0xff7AC8B8),
          ],
        ),
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
                  color: Colors.white,
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
                      color: Colors.white,
                    ),
                    gapW5,
                    GetBuilder<HomeController>(
                      builder: (controller) {
                        return  Text(
                          // 'Banasree, Dhaka,',
                          controller.locationDetails,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        );
                      }
                    ),
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
    );
  }
}
