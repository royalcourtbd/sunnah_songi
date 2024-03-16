import 'package:adhan/adhan.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sunnah_songi/app/common/utils/string_converter.dart';
import 'package:sunnah_songi/app/network/repository/home_repository.dart';
import 'package:sunnah_songi/app/network/repository/location_repository.dart';

class HomeController extends GetxController implements GetxService {
  final LocationRepository locationRepository;
  final HomeRepository homeRepository;
  HomeController({
    required this.locationRepository,
    required this.homeRepository,
  });

  String locationDetails = "";
  String arabicDate = "";
  String banglaDate = "";
  List<Map<String, String>> prayerTimesInBangla = [];
  String currentPrayerName = '';
  String currentPrayerTime = '০০ঃ০০ - ০০ঃ০০';
  String sunRise = "00.00";
  String sunSet = "00.00";
  String sehriEnd = "00.00";
  String iftartStart = "00.00";

  @override
  onInit() {
    super.onInit();
    initFunctions();
  }

  Future<void> initFunctions() async {
    await getCurrentLocation();
    String? locationString = await homeRepository.getSavedLocation();
    locationDetails = locationString??"Unknown!";

    await getCurrentArabicDate();
    prayerTimesInBangla = await getPrayerTime();
    cheking();
    update();
  }

  void cheking() {
    final foundPrayerTime = prayerTimesInBangla.firstWhereOrNull(
      (prayerTime) => prayerTime['name'] == currentPrayerName,
    );

    if (foundPrayerTime != null) {
      final start = convertTimeToBangla(foundPrayerTime['range']!.split('-').first);
      final end = convertTimeToBangla(foundPrayerTime['range']!.split('-').last);
      currentPrayerTime = "$start - $end";
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      final position = await locationRepository.getCurrentPosition();
      final placemark = await locationRepository.getCityAndCountry(position);
      locationDetails = "${placemark.street}, ${placemark.locality},\n${placemark.administrativeArea}, ${placemark.isoCountryCode}";
      await homeRepository.saveLocation(locationDetails);
    } catch (e) {
      locationDetails = "Unknown!";
    }
    update();
  }

  Future<void> getCurrentArabicDate() async {
    await initializeDateFormatting('en_US', null);

    final today = HijriCalendar.now();
    final dateTime = DateTime.now();

    banglaDate = formatDateTimeInBangla(dateTime);
    arabicDate = today.toFormat("dd MMMM, yyyy");
    update();
  }

  Future<List<Map<String, String>>> getPrayerTime() async {
    final position = await locationRepository.getCurrentPosition();
    final myCoordinates = Coordinates(position.latitude, position.longitude);
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.shafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    final output = <Map<String, String>>[];

    final fajrStart = prayerTimes.fajr.add(const Duration(minutes: 1));
    final fajrEnd = prayerTimes.sunrise;
    output.add({
      'name': 'ফজর',
      'range': '${DateFormat.jm().format(fajrStart)} - ${DateFormat.jm().format(fajrEnd)}',
    });

    final dhuhrStart = prayerTimes.dhuhr;
    final dhuhrEnd = prayerTimes.asr.subtract(const Duration(minutes: 1));
    output.add({
      'name': 'ধোহর',
      'range': '${DateFormat.jm().format(dhuhrStart)} - ${DateFormat.jm().format(dhuhrEnd)}',
    });

    final asrStart = prayerTimes.asr;
    final asrEnd = prayerTimes.maghrib.subtract(const Duration(minutes: 2));
    output.add({
      'name': 'আসর',
      'range': '${DateFormat.jm().format(asrStart)} - ${DateFormat.jm().format(asrEnd)}',
    });

    final maghribStart = prayerTimes.maghrib;
    final maghribEnd = prayerTimes.isha.subtract(const Duration(minutes: 1));
    output.add({
      'name': 'মাগরিব',
      'range': '${DateFormat.jm().format(maghribStart)} - ${DateFormat.jm().format(maghribEnd)}',
    });

    final ishaStart = prayerTimes.isha;
    final ishaEnd = ishaStart.add(const Duration(hours: 5, minutes: 56));
    output.add({
      'name': 'ইশা',
      'range': '${DateFormat.jm().format(ishaStart)} - ${DateFormat.jm().format(ishaEnd)}',
    });

    final sunriseStart = prayerTimes.sunrise;
    final sunset = prayerTimes.maghrib.subtract(const Duration(minutes: 2));

    sunRise = DateFormat.jm().format(sunriseStart);
    sunSet = DateFormat.jm().format(sunset);

    currentPrayerName = convertCurrentPrayerNameIntoBangla(prayerTimes.currentPrayer().name);
    sehriEnd = convertTimeToBangla(DateFormat.jm().format(prayerTimes.fajr.subtract(const Duration(minutes: 9))));
    iftartStart = convertTimeToBangla(DateFormat.jm().format(prayerTimes.maghrib));
    update();
    return output;
  }

  String convertCurrentPrayerNameIntoBangla(String name) {
    switch (name) {
      case "fajr":
        return "ফজর";
      case "dhuhr":
        return "ধোহর";
      case "asr":
        return "আসর";
      case "maghrib":
        return "মাগরিব";
      case "isha":
        return "ইশা";
      default:
        return '';
    }
  }
}































// import 'package:adhan/adhan.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:hijri/hijri_calendar.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/intl.dart';
// import 'package:sunnah_songi/app/common/utils/string_converter.dart';
// import 'package:sunnah_songi/app/network/repository/home_repository.dart';
// import 'package:sunnah_songi/app/network/repository/location_repository.dart';

// class HomeController extends GetxController implements GetxService {
//   final LocationRepository locationRepository;
//   final HomeRepository homeRepository;
//   HomeController(
//       {required this.locationRepository, required this.homeRepository});

//   String locationDetails = "";
//   String arabicDate = "";
//   String banglaDate = "";
//   List<Map<String, String>> prayerTimesInBangla = [
//     {'name': 'ফজর', 'range': '০০ঃ০০ - ০০ঃ০০'},
//     {'name': 'ধোহর', 'range': '০০ঃ০০ - ০০ঃ০০'},
//     {'name': 'আসর', 'range': '০০ঃ০০ - ০০ঃ০০'},
//     {'name': 'মাগরিব', 'range': '০০ঃ০০ - ০০ঃ০০'},
//     {'name': 'ইশা', 'range': '০০ঃ০০ - ০০ঃ০০'},

//   ];
//   String currentPrayerName = '';
//   String currentPrayerTime = '০০ঃ০০ - ০০ঃ০০';
//     String sunRise = "00.00";
//     String sunSet = "00.00";
//     String sehriEnd = "00.00";
//     String iftartStart = "00.00";


//   @override
//   onInit() {
//     super.onInit();
//     initFunctions();
//   }

//   void initFunctions() async {
//     await getCurrentLocation();
//     String? locationString = await homeRepository.getSavedLocation();
//     if (locationString != null) {
//       locationDetails = locationString;
//       update();
//     } else {
//       getCurrentLocation();
//     }

//     getCurrentArabicDate();
//     prayerTimesInBangla = await getPrayerTime();
//     cheking();
//     update();
//   }

//     void cheking(){
//   // Iterate through the list to find the entry with the desired name
//   Map<String, String>? foundPrayerTime;
//   for (var prayerTime in prayerTimesInBangla) {
//     if (prayerTime['name'] == currentPrayerName) {
//       foundPrayerTime = prayerTime;
//       break;
//     }
//   }

//   // Print the name and range if found
//   if (foundPrayerTime != null) {
//     String start = convertTimeToBangla(foundPrayerTime['range']!.split('-').first);
//     String end = convertTimeToBangla(foundPrayerTime['range']!.split('-').last);
//     currentPrayerTime = "$start - $end";
//   } 
//   }

//   Future<void> getCurrentLocation() async {
//     try {
//       await locationRepository.getCurrentPosition();
//       await locationRepository.getCurrentPosition().then((value) async {
//         Placemark placemark = await locationRepository.getCityAndCountry(value);
//         locationDetails = "${placemark.locality},${placemark.isoCountryCode}";
//         await homeRepository.saveLocation(locationDetails);
//         update();
//       });
//     } catch (e) {
//       locationDetails = "Unknown!";
//       update();
//       getCurrentLocation();
//     }
//   }

//   Future<void> getCurrentArabicDate() async {
//     // Initialize the locale data for date formatting
//     await initializeDateFormatting('en_US', null);

//     final today = HijriCalendar.now();
//     final dateTime = DateTime.now();

//     banglaDate = formatDateTimeInBangla(dateTime);
//     arabicDate = today.toFormat("dd MMMM, yyyy");

//     update();
//   }

//   Future<List<Map<String, String>>> getPrayerTime() async {
//     Position position = await locationRepository.getCurrentPosition();
//     final myCoordinates = Coordinates(position.latitude, position.longitude);
//     final params = CalculationMethod.karachi.getParameters();
//     /// Use  Madhab.shafi to get data as per salah.com , currently i am following aqidah apps time compass
//     params.madhab = Madhab.shafi;
//     final prayerTimes = PrayerTimes.today(myCoordinates, params);

//     List<Map<String, String>> output = [];

//     // Fajr
//     DateTime fajrStart = prayerTimes.fajr.add(const Duration(minutes: 1));
//     DateTime fajrEnd = prayerTimes.sunrise;
//     output.add({
//       'name': 'ফজর',
//       'range':
//           '${DateFormat.jm().format(fajrStart)} - ${DateFormat.jm().format(fajrEnd)}'
//     });

//     // Dhuhr
//     DateTime dhuhrStart = prayerTimes.dhuhr;
//     DateTime dhuhrEnd = prayerTimes.asr.subtract(const Duration(minutes: 1));
//     output.add({
//       'name': 'ধোহর',
//       'range':
//           '${DateFormat.jm().format(dhuhrStart)} - ${DateFormat.jm().format(dhuhrEnd)}'
//     });

//     // Asr
//     DateTime asrStart = prayerTimes.asr;
//     DateTime asrEnd = prayerTimes.maghrib.subtract(const Duration(minutes: 2));
//     output.add({
//       'name': 'আসর',
//       'range':
//           '${DateFormat.jm().format(asrStart).toString()} - ${DateFormat.jm().format(asrEnd)}'
//     });

//     // Maghrib
//     DateTime maghribStart = prayerTimes.maghrib;
//     DateTime maghribEnd = prayerTimes.isha.subtract(const Duration(minutes: 1));
//     output.add({
//       'name': 'মাগরিব',
//       'range':
//           '${DateFormat.jm().format(maghribStart)} - ${DateFormat.jm().format(maghribEnd)}'
//     });

//     // Isha
//     DateTime ishaStart = prayerTimes.isha;
//     DateTime ishaEnd = ishaStart.add(const Duration(hours: 5, minutes: 56));
//     output.add({
//       'name': 'ইশা',
//       'range':
//           '${DateFormat.jm().format(ishaStart)} - ${DateFormat.jm().format(ishaEnd)}'
//     });
//     // Sunrise
//     DateTime sunriseStart = prayerTimes.sunrise;
//     DateTime sunset = prayerTimes.maghrib
//         .subtract(const Duration(minutes: 2)); // Calculate sunset time

//     sunRise = DateFormat.jm().format(sunriseStart);
//     sunSet = DateFormat.jm().format(sunset);

//     currentPrayerName = convertCurrentPrayerNameIntoBangla(prayerTimes.currentPrayer().name);
//     sehriEnd = convertTimeToBangla(DateFormat.jm().format( prayerTimes.fajr.subtract(const Duration(minutes: 9))));
//     iftartStart = convertTimeToBangla(DateFormat.jm().format(prayerTimes.maghrib));
    
//     return output;
//   }


//   // List<Map<String, String>> prayerTimesInBangla = [
//   //   {'name': 'ফজর', 'range': '০০ঃ০০ - ০০ঃ০০'},
//   //   {'name': 'ধোহর', 'range': '০০ঃ০০ - ০০ঃ০০'},
//   //   {'name': 'আসর', 'range': '০০ঃ০০ - ০০ঃ০০'},
//   //   {'name': 'মাগরিব', 'range': '০০ঃ০০ - ০০ঃ০০'},
//   //   {'name': 'ইশা', 'range': '০০ঃ০০ - ০০ঃ০০'},

//   // ];

//   String convertCurrentPrayerNameIntoBangla(String name){
//     if(name=="fajr") return "ফজর";
//     if(name=="dhuhr") return "ধোহর";
//     if(name=="asr") return "আসর";
//     if(name=="maghrib") return "মাগরিব";
//     if(name=="isha") return "ইশা";
//     return '';
//   }
// }


