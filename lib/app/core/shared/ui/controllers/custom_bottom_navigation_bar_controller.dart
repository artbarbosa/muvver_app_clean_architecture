import 'package:flutter/material.dart';

class CustomBottomNavigationBarController extends ValueNotifier<int> {
  CustomBottomNavigationBarController(super.value, this.pageController);
  final PageController pageController;

  int get selectedIndex => value;

  void changePage(int index) {
    pageController.jumpToPage(index);
    value = index;
  }
}
