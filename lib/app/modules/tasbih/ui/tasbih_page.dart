import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/common/config/quran_color.dart';
import 'package:sunnah_songi/app/common/config/sunnah_screen.dart';
import 'package:sunnah_songi/app/external_libs/circular_seek_bar-master/circular_seek_bar.dart';
import 'package:sunnah_songi/app/modules/tasbih/controller/tasbih_controller.dart';

class TasbihPage extends StatelessWidget {
  const TasbihPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbih'),
      ),
      body: GetBuilder<TasbihController>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 40.percentWidth,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 20.percentWidth,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(tenPx),
                        ),
                      ),
                      child:  Text(controller.currentClick.toString(), style: const TextStyle(fontSize: 20)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 20.percentWidth,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(tenPx),
                        ),
                      ),
                      child: const Text('33', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
              const Text(
                'Tap on circle to count tasbih',
                style: TextStyle(fontSize: 20),
              ),
              CircularSeekBar(
                width: double.infinity,
                height: 200,
                progress: controller.currentClick.toDouble(),
                trackColor: SunnahColor.appBarColor,
                progressColor: SunnahColor.appbarColorLight,
                barWidth: 5,
                startAngle: 180,
                animDurationMillis: 100,
                maxProgress: 33,
                minProgress: 0,
                child: Center(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () => controller.incrementCount(),
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration:const BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.amber
                      ),
                      alignment: Alignment.center,
                      child: Text(controller.totalCount.toString(), style: TextStyle(fontSize: 20))),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(fiftyPx),
                  border: Border.all(
                    color: SunnahColor.appBarColor,
                    width: 2,
                  ),
                ),
                child: TextButton.icon(
                  onPressed: () => controller.resetCounter(),
                  icon: const Icon(
                    Icons.delete_outline,
                  ),
                  label: const Text(
                    'Reset',
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
