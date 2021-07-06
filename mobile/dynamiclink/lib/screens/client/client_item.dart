import 'package:dynamiclink/models/item.dart';
import 'package:dynamiclink/screens/client/client_item_card.dart';
import 'package:dynamiclink/screens/client/client_item_detail_card.dart';
import 'package:dynamiclink/services/order_day_service.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class ClientItem extends StatefulWidget {
  const ClientItem({Key? key}) : super(key: key);

  @override
  _ClientItemState createState() => _ClientItemState();
}

class _ClientItemState extends State<ClientItem> {
  late OrderDayService orderDayService;
  late List<Item> items;
  @override
  void initState() {
    orderDayService = OrderDayService();
    items = [];
    super.initState();
  }

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
        body: FutureBuilder<List<Item?>>(
            future: orderDayService.getAllOrders(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }
              if (snapshot.hasData) {
                var documents = snapshot.data;
                return ListView(
                  padding: const EdgeInsets.all(8),
                  children: documents!.map((data) {
                    return new ClientItemCard(data!, addItem, removeItem);
                  }).toList(),
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  addItem(data) {
    setState(() {
      items.add(data);
    });
  }

  removeItem(data) {
    setState(() {
      items.removeWhere((element) => element.id == data.id);
    });
  }

  Widget _shoppingCartBadge() {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 200),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        items.length.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            if (items.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CLientItemDetailCard(items: items)),
              );
            }
          }),
    );
  }
}
