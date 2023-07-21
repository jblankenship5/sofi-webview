import 'package:get/get.dart';
import 'package:sofi_interview/app/feature/home/controllers/home_controller.dart';

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewController>(() => HomeViewController());
  }
}
