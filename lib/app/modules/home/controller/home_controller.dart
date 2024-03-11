import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sunnah_songi/app/common/utils/string_converter.dart';
import 'package:sunnah_songi/app/network/repository/home_repository.dart';
import 'package:sunnah_songi/app/network/repository/location_repository.dart';

class HomeController extends GetxController implements GetxService{
   final LocationRepository locationRepository;
   final HomeRepository homeRepository;
   HomeController({required this.locationRepository, required this.homeRepository});

  String locationDetails = "Updating...";
  String arabicDate = "";
  String banglaDate = "";
 

  @override
  onInit(){
    super.onInit();
    initFunctions();
    

  }

  void initFunctions() async{
    String? locationString = await homeRepository.getSavedLocation();

    if(locationString !=null){
      locationDetails = locationString;
      update();
    }else{
    getCurrentLocation();
    }

    
    getCurrentArabicDate();

  }


  Future<void> getCurrentLocation() async {
    try {
      await  locationRepository.getCurrentPosition();
       await locationRepository.getCurrentPosition().then((value) async {
          Placemark placemark = await locationRepository.getCityAndCountry(value);
          locationDetails = "${placemark.locality},${placemark.isoCountryCode}";
          await homeRepository.saveLocation(locationDetails);
          update();
       });
         
    } catch (e) {
      log("Error: $e");
      locationDetails = "Unknown!";
      update();
      getCurrentLocation();
    }
  }


Future<void> getCurrentArabicDate() async {
  // Initialize the locale data for date formatting
  await initializeDateFormatting('en_US', null);

  final today = HijriCalendar.now();
  final dateTime = DateTime.now();

  banglaDate = formatDateTimeInBangla(dateTime);
  arabicDate = today.toFormat("dd MMMM, yyyy");

  update();
}



}