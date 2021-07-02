import 'package:dynamiclink/screens/client/client_item_card.dart';
import 'package:dynamiclink/screens/client/client_item_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class ClientItem extends StatefulWidget {
  const ClientItem({Key? key}) : super(key: key);

  @override
  _ClientItemState createState() => _ClientItemState();
}

class _ClientItemState extends State<ClientItem> {
  int _counter = 0;

  final List<String> names = <String>[
    'Aby',
    'Aish',
    'Ayan',
    'Ben',
    'Bob',
    'Charlie',
    'Cook',
    'Carline'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        title: Text(
          'Productos del Dia',
          textAlign: TextAlign.center,
        ),
        actions: [_shoppingCartBadge()],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: names.length,
          itemBuilder: (BuildContext context, int index) {
            return new ClientItemCard(addItem, removeItem);
          }),
    );
  }

  addItem(data) {
    setState(() {
      _counter++;
    });
  }

  removeItem(data) {
    setState(() {
      _counter--;
    });
  }

  Widget _shoppingCartBadge() {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 200),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        _counter.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CLientItemDetailCard()),
            );
          }),
    );
  }
}
