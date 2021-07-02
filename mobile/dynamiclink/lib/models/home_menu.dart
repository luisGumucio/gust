import 'package:flutter/material.dart';

class HomeMenu {
  late List<Widget> options;
  late List<BottomNavigationBarItem> navigations;

  HomeMenu(List<Widget> options, List<BottomNavigationBarItem> navigations) {
    this.options = options;
    this.navigations = navigations;
  }
}
