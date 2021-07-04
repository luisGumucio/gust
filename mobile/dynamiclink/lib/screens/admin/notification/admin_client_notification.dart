import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamiclink/models/client.dart';
import 'package:dynamiclink/services/client_service.dart';
import 'package:flutter/material.dart';

import 'admin_card_notification.dart';

final GlobalKey<_AdminClientNotificationState> globalKey = GlobalKey();

class AdminClientNotification extends StatefulWidget {
  final Function(Object) addItem;
  final Function(Object) removeItem;
  final StreamController<String> reset;
  AdminClientNotification(
      {required this.addItem, required this.removeItem, required this.reset})
      : super(key: globalKey);

  @override
  _AdminClientNotificationState createState() =>
      _AdminClientNotificationState();
}

class _AdminClientNotificationState extends State<AdminClientNotification> {
  late ClientService clientService;
  late Future<QuerySnapshot> data;
  @override
  void initState() {
    clientService = ClientService();
    data = clientService.getAllClients();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AdminClientNotification oldWidget) {
    // if (widget.isReset) {
    //   setState(() {
    //     data = clientService.getAllClients();
    //   });
    // }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      child: FutureBuilder<QuerySnapshot>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData) {
            var documents = snapshot.data!.docs;
            return new ListView(
              scrollDirection: Axis.horizontal,
              children: documents.map((doc) {
                Client client = Client();
                client.name = doc['firstName'];
                client.telegramId = doc['telegramId'].toString();
                var extraInfo = doc['phoneNumber'];
                return new AdminCardNotification(
                    name: client.name,
                    extraInformation: extraInfo,
                    data: client,
                    addItem: widget.addItem,
                    removeItem: widget.removeItem,
                    reset: widget.reset);
              }).toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  getItems() {
    return clientService.getAllClients();
  }
}
