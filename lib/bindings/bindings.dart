import 'package:get/get.dart';
import 'package:pas_21/controller/bottomnav_controller.dart';

class MyBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => BottomNavController());
    // Get.lazyPut(() => SearchLogic());
    // Get.lazyPut(() => ResponsiveController());
    //Get.lazyPut(() => LikeController());

  }
}