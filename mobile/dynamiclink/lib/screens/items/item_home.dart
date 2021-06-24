import 'package:flutter/material.dart';

import 'item_create_view.dart';
import 'item_list_view.dart';

class ItemHome extends StatefulWidget {
  const ItemHome({Key? key}) : super(key: key);

  @override
  _ItemHomeState createState() => _ItemHomeState();
}

class _ItemHomeState extends State<ItemHome> {
  late Map<String, dynamic> views;
  String keyView = 'itemList';

  @override
  void initState() {
    super.initState();
    views = Map<String, dynamic>();
    views["itemList"] = ItemListView('itemCreate', callback);
    views["itemCreate"] = ItemCreateView('itemList', callback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: views[keyView],
    );
  }

  callback(newKeyView) {
    setState(() {
      keyView = newKeyView;
    });
  }
}
