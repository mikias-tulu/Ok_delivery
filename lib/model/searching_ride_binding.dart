import 'package:get/get.dart';
import 'package:ok_delivery/controller/searching_ride_controller.dart';
import 'package:ok_delivery/screens/home/home_screen.dart';

class SearchingRideBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SearchingRideController(),
    );
  }
}
