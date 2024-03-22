import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/common/config/quran_color.dart';
import 'package:sunnah_songi/app/common/config/sunnah_screen.dart';
import 'package:sunnah_songi/app/common/utils/string_converter.dart';
import 'package:sunnah_songi/app/external_libs/circular_seek_bar-master/circular_seek_bar.dart';
import 'package:sunnah_songi/app/modules/tasbih/controller/tasbih_controller.dart';
import 'package:sunnah_songi/app/static/ui_const.dart';

class TasbihPage extends StatelessWidget {
  const TasbihPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('তাসবিহ',style: TextStyle(
          fontFamily: "Kalpurush"
        ),),
      ),
      body: GetBuilder<TasbihController>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gapH20,
              SizedBox(height: 5.percentHeight,),
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
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(tenPx),
                        ),
                      ),
                      child:  Text( convertTimeToBangla(controller.currentClick.toString()),
                       style: const TextStyle(fontFamily: "Kalpurush",fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 20.percentWidth,
                      decoration: BoxDecoration(
                        color: Colors.green[900],
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(tenPx),
                        ),
                      ),
                      child: const  Text("৩৩", style:  TextStyle(
                        fontFamily: "Kalpurush",
                        fontSize: 20,
                        color: Colors.white, fontWeight: FontWeight.bold
                        )),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                'বৃত্তাকার পৃষ্ঠে ক্লিক করুন',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Kalpurush"
                  ),
              ),
              gapH20,
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
                      child: Text( convertTimeToBangla(controller.totalCount.toString()),
                       style: const TextStyle(fontFamily: "Kalpurush",fontSize: 20))
                      
                      ),
                  ),
                ),
              ),
              const Spacer(),
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
                    'রিসেট করুন',
                    style: TextStyle(
                      fontFamily: "Kalpurush"
                    ),
                  ),
                ),
              ),
              gapH30,
            
            ],
          );
        }
      ),
    );
  }
}
