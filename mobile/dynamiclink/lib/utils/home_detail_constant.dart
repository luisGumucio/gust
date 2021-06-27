import 'package:dynamiclink/screens/client/client_item.dart';
import 'package:flutter/material.dart';

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

List<Widget> widgetClientOptions = <Widget>[
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
