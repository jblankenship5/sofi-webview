import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofi_interview/app/routes/pages.dart';
import 'package:sofi_interview/app/routes/routes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.home,
      getPages: Pages.pages,
    );
  }
}
