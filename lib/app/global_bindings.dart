import 'package:get/get.dart';
import 'package:sunnah_songi/app/modules/home/controller/home_controller.dart';
import 'package:sunnah_songi/app/network/repository/home_repository.dart';
import 'package:sunnah_songi/app/network/repository/location_repository.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() async {
    /// Services
    // final sharedPreferences = await SharedPreferences.getInstance();
    // Get.lazyPut(() => SharedPreferences.getInstance());

    /// Repository
    Get.lazyPut(() => LocationRepository());
    Get.lazyPut(() => HomeRepository());

    /// Controller
    Get.lazyPut(() => HomeController(locationRepository: Get.find(), homeRepository: Get.find()));
  }
}
