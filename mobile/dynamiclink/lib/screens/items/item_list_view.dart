import 'package:dynamiclink/services/item_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamiclink/utils/app_theme.dart';
import 'package:flutter/material.dart';

class ItemListView extends StatefulWidget {
  final String keyView;
  final Function(String) callback;

  ItemListView(this.keyView, this.callback);

  @override
  _ItemListViewState createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  late ItemService itemService;
  @override
  void initState() {
    super.initState();
    itemService = ItemService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _getBodyList(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              widget.callback(widget.keyView);
            },
            child: const Icon(Icons.add),
            backgroundColor: AppTheme.buildLightTheme().accentColor));
  }

  Widget _getBodyList() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Flexible(child: _getItemList())],
      ),
    );
  }

  Widget _getItemList() {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder<QuerySnapshot>(
      future: itemService.getAllRooms(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData) {
          var documents = snapshot.data!.docs;
          return Container(
            height: size.height,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Productos",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView(
                  children: documents
                      .map((doc) => Container(
                              height: 150,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withAlpha(100),
                                        blurRadius: 10.0),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          doc["name"],
                                          style: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // Text(
                                        //   'post["brand"]',
                                        //   style: const TextStyle(
                                        //       fontSize: 17, color: Colors.grey),
                                        // ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          "\Bs ${doc["price"]}",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Image.asset(
                                      "assets/pecho.jpeg",
                                      height: 130,
                                      width: 150,
                                    )
                                  ],
                                ),
                              ))
                          // ItemPage(
                          //   item: new ItemSingle(
                          //     id: doc.id,
                          //     name: doc['name'],
                          //     price: doc['price']
                          //   )
                          // )
                          )
                      .toList(),
                ))
              ],
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
