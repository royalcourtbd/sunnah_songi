import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunnah_songi/app/common/config/app_urls.dart';

/// Comment kora code gulo pore use korte hobe tai rekhe diyechi

class HomeRepository extends GetxService {
  // final ApiService apiService;
  // final SharedPreferences sharedPreferences;
  HomeRepository();


  
  Future<bool> saveLocation(String location) async {
  final SharedPreferences sharedPreferences =  await   SharedPreferences.getInstance();

    return await sharedPreferences.setString(AppUrls.locationKey, location);
  }

  Future<String?> getSavedLocation() async {
  final SharedPreferences sharedPreferences =  await   SharedPreferences.getInstance();

    return sharedPreferences.getString(AppUrls.locationKey);
  }
}
