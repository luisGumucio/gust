import 'package:dynamiclink/models/client.dart';
import 'package:dynamiclink/models/item.dart';
import 'package:dynamiclink/models/order.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class NotificationService {
  final String url = 'http://192.168.42.79:3000/api';

  Future<int> sendNotification(List<Item> items, List<Client> clients) async {
    var client = http.Client();
    try {
      var body = json.encode({
        "items": items.map((e) => e.toJson()).toList(),
        "clients": clients.map((e) => e.toJson()).toList()
      });
      var uriResponse = await client.post(Uri.parse(url + '/notifications'),
          headers: {"Content-Type": "application/json"}, body: body);
      return uriResponse.statusCode;
    } finally {
      client.close();
    }
  }

  Future<int> orderRegister(Order order) async {
    var client = http.Client();
    try {
      DateTime now = DateTime.now();
      String date = DateFormat('dd/MM/yyyy').format(now);
      order.date = date;
      var body = json.encode({
        'userId': order.UserId,
        'date': order.date,
        'itemsOrders': order.itemOrders.map((e) => e.toJson()).toList()
      });
      var uriResponse = await client.post(Uri.parse(url + '/orders'),
          headers: {"Content-Type": "application/json"}, body: body);
      return uriResponse.statusCode;
    } finally {
      client.close();
    }
  }
}
