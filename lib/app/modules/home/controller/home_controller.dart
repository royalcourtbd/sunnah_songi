import 'package:adhan/adhan.dart';
import 'package:get/get.dart';

class HomeController extends GetxController implements GetxService {
  HomeController();

  final myCoordinates = Coordinates(25.7468, 89.2508);
  final params = CalculationMethod.karachi.getParameters();
  final nyDate = DateComponents(2015, 7, 12);
}
