import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class NavigatorName {
  static const int home = 0;
  static const int cart = 1;
  static const int orders = 2;
  static const int profile = 3;
}

class NavigatorController extends GetxController {
  late PageController _pageController;
  late RxInt _currentIndex;

  PageController get pageController => _pageController;
  int get currentIndex => _currentIndex.value;

  @override
  void onInit() {
    super.onInit();
    _initNavigation(
      pageController: PageController(initialPage: NavigatorName.home),
      currentIndex: NavigatorName.home,
    );
  }

  void _initNavigation(
      {required PageController pageController, required int currentIndex}) {
    _pageController = pageController;
    _currentIndex = currentIndex.obs;
  }

  void navigatePageView({required int page}) {
    if (_currentIndex.value == page) return;
    _pageController.jumpToPage(page);
    _currentIndex.value = page;
  }
}
