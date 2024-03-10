import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:sunnah_songi/app/network/repository/location_repository.dart';

class HomeController extends GetxController implements GetxService{
   final LocationRepository locationRepository;
   HomeController({required this.locationRepository});

  String locationDetails = "Updating...";
  String arabicDate = "";


  @override
  onInit(){
    super.onInit();
    getCurrentLocation();
    getCurrentArabicDate();

  }


  Future<void> getCurrentLocation() async {
    try {
      await  locationRepository.getCurrentPosition();
       await locationRepository.getCurrentPosition().then((value) async {
          Placemark placemark = await locationRepository.getCityAndCountry(value);
          locationDetails = "${placemark.locality},${placemark.isoCountryCode}";
          update();
       });
         
    } catch (e) {
      log("Error: $e");
      locationDetails = "Unknown!";
      update();
      getCurrentLocation();
    }
  }


  void getCurrentArabicDate() async  {
    HijriCalendar today = HijriCalendar.now();
  //   DateTime dateTime = await DateTime.now();
  //     var formatter = DateFormat.yMMMMd('bn');

  // String formattedDate = formatter.format(dateTime);
  // String formattedTime = DateFormat('jm', 'bn').format(dateTime);


  //   print("===========> ${formattedDate + ', ' + formattedTime}");
    arabicDate = today.toFormat("dd MMMM, yyyy");
    update();

  }





}