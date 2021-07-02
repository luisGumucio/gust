import 'package:dynamiclink/models/client.dart';
import 'package:dynamiclink/models/item.dart';
import 'package:dynamiclink/screens/admin/notification/admin_item_notification.dart';
import 'package:dynamiclink/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'admin_client_notification.dart';

class AdminHomeNotification extends StatefulWidget {
  const AdminHomeNotification({Key? key}) : super(key: key);

  @override
  _AdminHomeNotificationState createState() => _AdminHomeNotificationState();
}

class _AdminHomeNotificationState extends State<AdminHomeNotification> {
  List<Item> items = [];
  List<Client> clients = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Productos',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0)),
            SizedBox(height: 10.0),
            AdminItemNotification(addItem: _addItem, removeItem: _removeItem),
            SizedBox(height: 10.0),
            AdminClientNotification(
                addItem: _addClient, removeItem: _removeClient),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total productos',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0)),
                Text(items.length.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total usuarios',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0)),
                Text(clients.length.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21))
              ],
            ),
            Spacer(),
            MaterialButton(
              onPressed: () {
                print('go');
              },
              color: Colors.green,
              height: 50.0,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.9)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Enviar Notificacion',
                    style: TextStyle(
                        color: AppTheme.buildLightTheme().bottomAppBarColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10.0),
                  Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18.0,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 18,
            )
          ],
        ),
      ),
    );
  }

  _addItem(Object item) {
    setState(() {
      items.add(item as Item);
    });
  }

  _removeItem(Object item) {
    setState(() {
      var itemFound = item as Item;
      items.removeWhere((element) => element.id == itemFound.id);
    });
  }

  _addClient(Object client) {
    setState(() {
      clients.add(client as Client);
    });
  }

  _removeClient(Object client) {
    setState(() {
      var clientFound = client as Client;
      clients.removeWhere(
          (element) => element.telegramId == clientFound.telegramId);
    });
  }
}
