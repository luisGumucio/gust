// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamiclink/models/item.dart';
import 'package:intl/intl.dart';

class OrderDayService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orderDay');

  Future<List<Item>> getAllOrders() async {
    DateTime now = DateTime.now();
    String date = DateFormat('dd/MM/yyyy').format(now);
    var data = await orders.where('date', isEqualTo: date).get().then((value) {
      return value.docs.cast();
    });
    print(data);
    List<dynamic> dataItem = [];
    List<Item> items = [];

    data.forEach((e) {
      dataItem = e['items'];
      dataItem.forEach((element) {
        var item = new Item();
        item.id = element['id'];
        item.name = element['name'];
        item.price = double.parse(element['price'].toString());
        items.add(item);
      });
    });
    return items;
  }
}
