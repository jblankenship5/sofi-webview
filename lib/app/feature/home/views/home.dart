import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:sofi_interview/app/feature/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeViewController> {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Form(
            key: controller.formKey,
            child: TextFormField(
              onFieldSubmitted: (_) => controller.submit(),
              controller: controller.textEditingController,
              validator: ValidationBuilder().url().maxLength(50).build(),
            ),
          ),
          TextButton(
            onPressed: controller.submit,
            child: const Text('submit'),
          ),
          Expanded(
            child: Obx(() => IndexedStack(index: controller.index, children: [
                  Center(
                    child: Obx(() {
                      switch (controller.pageState) {
                        case PageState.submitted:
                          return const Center(
                              child: CircularProgressIndicator());
                        case PageState.error:
                          return const Center(
                              child: Text('error loading page'));
                        default:
                          return const Text('Enter a url');
                      }
                    }),
                  ),
                  InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(
                          controller.textEditingController.text.trim()),
                    ),
                    onWebViewCreated: (wVcontroller) {
                      controller.webViewController = wVcontroller;
                    },
                    onLoadStart: (wVcontroller, url) {
                      controller.index = 0;
                    },
                    onLoadStop: (wVcontroller, url) {
                      controller.index = 1;
                    },
                    onLoadError: (wVcontroller, url, code, message) {
                      controller.pageState = PageState.error;
                      controller.index = 0;
                    },
                    onLoadHttpError: (wVcontroller, url, code, message) {
                      controller.pageState = PageState.error;
                      controller.index = 0;
                    },
                  )
                ])),
          ),
        ],
      )),
    );
  }
}
