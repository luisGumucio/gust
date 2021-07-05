import 'package:dynamiclink/models/client.dart';
import 'package:dynamiclink/models/item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
}
