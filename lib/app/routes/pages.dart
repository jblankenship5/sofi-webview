import 'package:get/get.dart';
import 'package:sofi_interview/app/feature/home/bindings/home_view_binding.dart';
import 'package:sofi_interview/app/feature/home/views/home.dart';
import 'package:sofi_interview/app/routes/routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeViewBinding(),
    ),
  ];
}
