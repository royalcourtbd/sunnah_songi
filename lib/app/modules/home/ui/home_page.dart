import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/modules/home/controller/home_controller.dart';
import 'package:sunnah_songi/app/modules/home/widgets/daily_salat_info.dart';
import 'package:sunnah_songi/app/modules/home/widgets/show_location_section.dart';
import 'package:sunnah_songi/app/modules/home/widgets/show_todays_date.dart';
import 'package:sunnah_songi/app/static/ui_const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  HomeController _homeController = Get.find();


  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সুন্নাহ সঙ্গী'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: RefreshIndicator(
          onRefresh: () async{
            _homeController.initFunctions();
          //  await  _homeController.getCurrentLocation();
          //    _homeController.getCurrentArabicDate();
            
          },
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              gapH15,
               const ShowLocationSection(),
              gapH15,
              const ShowTodaysDate(),
              gapH15,
              const DailySalatInfo()
            ],
          ),
        ),
      ),
    );
  }
}
