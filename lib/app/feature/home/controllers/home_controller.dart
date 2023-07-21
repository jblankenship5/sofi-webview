import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

enum PageState { init, submitted, error }

class HomeViewController extends GetxController {
  late TextEditingController _textEditingController;
  TextEditingController get textEditingController => _textEditingController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final RxInt _index = 0.obs;
  int get index => _index.value;
  set index(int value) => _index.value = value;

  final Rx<PageState> _pageState = PageState.init.obs;
  PageState get pageState => _pageState.value;
  set pageState(PageState value) => _pageState.value = value;
  late InAppWebViewController? webViewController;

  @override
  void onInit() {
    _textEditingController = TextEditingController(text: 'https://');
    super.onInit();
  }

  void submit() {
    checkHttps();
    if (formKey.currentState?.validate() ?? false) {
      loadPage();
      FocusManager.instance.primaryFocus?.unfocus();
    } else {
      print('invalid url');
    }
  }

  void loadPage() {
    _pageState.value = PageState.submitted;
    webViewController?.loadUrl(
        urlRequest:
            URLRequest(url: Uri.parse(_textEditingController.text.trim())));
  }

  void checkHttps() {
    if (textEditingController.text.startsWith('https://')) {
      return;
    } else if (textEditingController.text.startsWith('http://')) {
      textEditingController.text =
          textEditingController.text.replaceFirst('http://', 'https://');
    } else {
      textEditingController.text = 'https://${textEditingController.text}';
    }
  }
}
