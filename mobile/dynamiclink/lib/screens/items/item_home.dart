import 'package:dynamiclink/services/auth.dart';
import 'package:flutter/material.dart';
import 'item_create_view.dart';
import 'item_list_view.dart';

class ItemHome extends StatefulWidget {
  final AuthService authService;
  const ItemHome({Key? key, required this.authService}) : super(key: key);

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
            onPressed: () {
              widget.authService.signOut();
            },
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


          // Stack(
          //   children: <Widget>[
          //     IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          //     Positioned(
          //       right: 0,
          //       child: Container(
          //         alignment: Alignment.center,
          //         padding: EdgeInsets.all(4),
          //         decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: Color.fromRGBO(255, 204, 0, 1)),
          //         child: Text(
          //           '56',
          //           style: TextStyle(fontSize: 12, color: Colors.black),
          //         ),
          //       ),
          //     ),