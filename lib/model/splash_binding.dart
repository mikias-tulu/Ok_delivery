import 'package:get/get.dart';
import 'package:ok_delivery/screens/home/home_screen.dart';
//import '../controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeScreen(), //SplashController(),
    );
  }
}
