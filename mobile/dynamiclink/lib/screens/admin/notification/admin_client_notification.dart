import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamiclink/models/client.dart';
import 'package:dynamiclink/services/client_service.dart';
import 'package:flutter/material.dart';

import 'admin_card_notification.dart';

class AdminClientNotification extends StatefulWidget {
  final Function(Object) addItem;
  final Function(Object) removeItem;
  const AdminClientNotification(
      {Key? key, required this.addItem, required this.removeItem})
      : super(key: key);

  @override
  _AdminClientNotificationState createState() =>
      _AdminClientNotificationState();
}

class _AdminClientNotificationState extends State<AdminClientNotification> {
  late ClientService clientService;
  @override
  void initState() {
    clientService = ClientService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      child: FutureBuilder<QuerySnapshot>(
        future: clientService.getAllClients(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData) {
            var documents = snapshot.data!.docs;
            return ListView(
              scrollDirection: Axis.horizontal,
              children: documents.map((doc) {
                Client client = Client();
                client.name = doc['firstName'];
                client.telegramId = doc['telegramId'].toString();
                var extraInfo = doc['phoneNumber'];
                return AdminCardNotification(
                    name: client.name,
                    extraInformation: extraInfo,
                    data: client,
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
