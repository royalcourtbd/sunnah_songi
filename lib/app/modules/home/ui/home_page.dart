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
  final List<Map<String, String>> prayerTimesInBangla = [
    {'name': 'ফজর', 'range': '০৫ঃ০১ - ০৬ঃ১৫'},
    {'name': 'ধোহর', 'range': '১২ঃ১৫ - ১২ঃ৪৫'},
    {'name': 'আসর', 'range': '৩ঃ৪৫ - ৪ঃ৩০'},
    {'name': 'মাগরিব', 'range': '৬ঃ১৫ - ৬ঃ৩০'},
    {'name': 'ইশা', 'range': '৭ঃ৩০ - ৮ঃ১৫'},
  ];

  HomeController _homeController = Get.find();


  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunnah Songi'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: RefreshIndicator(
          onRefresh: () async{
           await  _homeController.getCurrentLocation();
             _homeController.getCurrentArabicDate();
            
          },
          child: ListView(
            children: <Widget>[
              gapH15,
               ShowLocationSection(),
              gapH15,
              const ShowTodaysDate(),
              gapH15,
              DailySalatInfo(prayerTimesInBangla: prayerTimesInBangla)
            ],
          ),
        ),
      ),
    );
  }
}
