import 'package:adhan/adhan.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
  HomeController(
      {required this.locationRepository, required this.homeRepository});

  String locationDetails = "Checking";
  String arabicDate = "";
  String banglaDate = "";
  List<Map<String, String>> prayerTimesInBangla = [
    {'name': 'ফজর', 'range': '০০ঃ০০ - ০০ঃ০০'},
    {'name': 'ধোহর', 'range': '০০ঃ০০ - ০০ঃ০০'},
    {'name': 'আসর', 'range': '০০ঃ০০ - ০০ঃ০০'},
    {'name': 'মাগরিব', 'range': '০০ঃ০০ - ০০ঃ০০'},
    {'name': 'ইশা', 'range': '০০ঃ০০ - ০০ঃ০০'},

  ];
  



    String sunRise = "00.00";
    String sunSet = "00.00";


  @override
  onInit() {
    super.onInit();
    initFunctions();
  }

  void initFunctions() async {
    await getCurrentLocation();
    String? locationString = await homeRepository.getSavedLocation();
    if (locationString != null) {
      locationDetails = locationString;
      update();
    } else {
      getCurrentLocation();
    }

    getCurrentArabicDate();
    prayerTimesInBangla = await getPrayerTime();
    update();
  }

  Future<void> getCurrentLocation() async {
    try {
      await locationRepository.getCurrentPosition();
      await locationRepository.getCurrentPosition().then((value) async {
        Placemark placemark = await locationRepository.getCityAndCountry(value);
        locationDetails = "${placemark.locality},${placemark.isoCountryCode}";
        await homeRepository.saveLocation(locationDetails);
        update();
      });
    } catch (e) {
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

  Future<List<Map<String, String>>> getPrayerTime() async {
    Position position = await locationRepository.getCurrentPosition();
    final myCoordinates = Coordinates(position.latitude, position.longitude);
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.shafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    List<Map<String, String>> output = [];

    // Fajr
    DateTime fajrStart = prayerTimes.fajr.add(const Duration(minutes: 1));
    DateTime fajrEnd = prayerTimes.sunrise;
    output.add({
      'name': 'ফজর',
      'range':
          '${DateFormat.jm().format(fajrStart)} - ${DateFormat.jm().format(fajrEnd)}'
    });

    // Dhuhr
    DateTime dhuhrStart = prayerTimes.dhuhr;
    DateTime dhuhrEnd = prayerTimes.asr.subtract(const Duration(minutes: 1));
    output.add({
      'name': 'ধোহর',
      'range':
          '${DateFormat.jm().format(dhuhrStart)} - ${DateFormat.jm().format(dhuhrEnd)}'
    });

    // Asr
    DateTime asrStart = prayerTimes.asr;
    DateTime asrEnd = prayerTimes.maghrib.subtract(const Duration(minutes: 2));
    output.add({
      'name': 'আসর',
      'range':
          '${DateFormat.jm().format(asrStart).toString()} - ${DateFormat.jm().format(asrEnd)}'
    });

    // Maghrib
    DateTime maghribStart = prayerTimes.maghrib;
    DateTime maghribEnd = prayerTimes.isha.subtract(const Duration(minutes: 1));
    output.add({
      'name': 'মাগরিব',
      'range':
          '${DateFormat.jm().format(maghribStart)} - ${DateFormat.jm().format(maghribEnd)}'
    });

    // Isha
    DateTime ishaStart = prayerTimes.isha;
    DateTime ishaEnd = ishaStart.add(const Duration(hours: 5, minutes: 56));
    output.add({
      'name': 'ইশা',
      'range':
          '${DateFormat.jm().format(ishaStart)} - ${DateFormat.jm().format(ishaEnd)}'
    });
    // Sunrise
    DateTime sunriseStart = prayerTimes.sunrise;
    DateTime sunset = prayerTimes.maghrib
        .subtract(const Duration(minutes: 2)); // Calculate sunset time

    sunRise = DateFormat.jm().format(sunriseStart);
    sunSet = DateFormat.jm().format(sunset);
    // output.add({
    //   'name': 'sunrise',
    //   'range':
    //       '${DateFormat.jms().format(sunriseStart)} - ${DateFormat.jm().format(sunset)}'
    // });

    return output;
  }
}
