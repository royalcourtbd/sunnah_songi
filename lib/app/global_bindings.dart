import 'package:get/get.dart';
import 'package:sunnah_songi/app/modules/home/controller/home_controller.dart';
import 'package:sunnah_songi/app/network/repository/location_repository.dart';

class GlobalBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => LocationRepository());

   Get.lazyPut(() => HomeController(locationRepository: Get.find()));
  }
  
}