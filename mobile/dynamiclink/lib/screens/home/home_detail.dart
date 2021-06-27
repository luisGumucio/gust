import 'package:dynamiclink/utils/app_theme.dart';
import 'package:flutter/material.dart';

class HomeDetail extends StatefulWidget {
  final List<Widget> widgetOptions;
  final List<BottomNavigationBarItem> itemsBottomNavigation;
  const HomeDetail(
      {Key? key,
      required this.widgetOptions,
      required this.itemsBottomNavigation})
      : super(key: key);

  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.buildLightTheme(),
      child: Scaffold(
          body: Center(child: widget.widgetOptions.elementAt(_selectedIndex)),
          bottomNavigationBar: BottomNavigationBar(
            items: widget.itemsBottomNavigation,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
          )),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
