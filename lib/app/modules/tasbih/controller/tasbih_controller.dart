import 'package:get/get.dart';

class TasbihController extends GetxController implements GetxService{
  int totalCount = 0;
  int currentClick = 0;

  void incrementCount(){
    totalCount = totalCount+1;
    if(currentClick == 33){
      currentClick = 1;
    } else{
    currentClick = currentClick+1;
    }
    update();
  }

  void resetCounter(){
    currentClick = 0;
    totalCount = 0;
    update();
  }
}