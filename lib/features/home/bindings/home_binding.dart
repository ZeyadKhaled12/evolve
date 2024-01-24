import 'package:get/get.dart';
import 'package:tdh_event/features/home/controllers/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
