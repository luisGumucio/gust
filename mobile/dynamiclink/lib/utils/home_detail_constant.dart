import 'package:dynamiclink/models/home_menu.dart';
import 'package:dynamiclink/screens/admin/notification/admin_home_notification.dart';
import 'package:dynamiclink/screens/client/client_item.dart';
import 'package:flutter/material.dart';

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

Map<String, HomeMenu> menu = {
  'admin': new HomeMenu(widgetAdminOptions, itemsAdminBottomNavigation),
  'client': new HomeMenu(widgetClientOptions, itemsClientBottomNavigation)
};
const List<Widget> widgetClientOptions = <Widget>[
  ClientItem(),
  Text(
    'Pedidos',
    style: optionStyle,
  ),
  Text(
    'cerca de mi',
    style: optionStyle,
  ),
];

const List<Widget> widgetAdminOptions = <Widget>[
  Text(
    'Pedidos',
    style: optionStyle,
  ),
  AdminHomeNotification(),
  Text(
    'Productos',
    style: optionStyle,
  ),
];

const itemsClientBottomNavigation = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Productos',
    backgroundColor: Colors.grey,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.map),
    label: 'Pedidos',
    backgroundColor: Colors.grey,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    label: 'Cerca de mi',
    backgroundColor: Colors.grey,
  )
];

const itemsAdminBottomNavigation = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Pedidos',
    backgroundColor: Colors.grey,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.notifications),
    label: 'Notificaciones',
    backgroundColor: Colors.grey,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.food_bank),
    label: 'Productos',
    backgroundColor: Colors.grey,
  )
];
