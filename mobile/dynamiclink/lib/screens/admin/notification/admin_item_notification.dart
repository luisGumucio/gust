import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamiclink/models/item.dart';
import 'package:dynamiclink/screens/admin/notification/admin_card_notification.dart';
import 'package:dynamiclink/services/item_service.dart';
import 'package:flutter/material.dart';

class AdminItemNotification extends StatefulWidget {
  final Function(Object) addItem;
  final Function(Object) removeItem;
  const AdminItemNotification(
      {Key? key, required this.addItem, required this.removeItem})
      : super(key: key);

  @override
  _AdminItemNotificationState createState() => _AdminItemNotificationState();
}

class _AdminItemNotificationState extends State<AdminItemNotification> {
  late ItemService itemService;
  @override
  void initState() {
    super.initState();
    itemService = ItemService();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      child: FutureBuilder<QuerySnapshot>(
        future: itemService.getAllRooms(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData) {
            var documents = snapshot.data!.docs;
            return ListView(
              scrollDirection: Axis.horizontal,
              children: documents.map((doc) {
                Item item = Item();
                item.id = doc.id;
                item.name = doc['name'];
                item.price = double.parse(doc['price'].toString());
                var extraInfo = "${item.price} bs/kg";
                return AdminCardNotification(
                    name: item.name,
                    extraInformation: extraInfo,
                    data: item,
                    addItem: widget.addItem,
                    removeItem: widget.removeItem);
              }).toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
