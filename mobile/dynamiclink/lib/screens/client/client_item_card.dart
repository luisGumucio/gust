import 'package:dynamiclink/models/item.dart';
import 'package:flutter/material.dart';

class ClientItemCard extends StatefulWidget {
  final Function(Item) addItem;
  final Function(Item) removeItem;
  final Item data;
  ClientItemCard(this.data, this.addItem, this.removeItem);

  @override
  _ClientItemCardState createState() => _ClientItemCardState();
}

class _ClientItemCardState extends State<ClientItemCard> {
  String icon = "mas";
  @override
  Widget build(BuildContext context) {
    return _getItemsCard();
  }

  Card _getItemsCard() {
    return Card(
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(9.0),
            child: FadeInImage(
                image: AssetImage('assets/pecho.jpeg'),
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/loading.gif'),
                height: 70),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(widget.data.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '\Bs ${widget.data.price}/Kg',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.red[500]),
                  )),
            ],
          )),
          SizedBox(
            width: 20,
          ),
          Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 10.0),
                  child: ElevatedButton.icon(
                    icon: Icon(
                      icon == "mas"
                          ? Icons.add_box_rounded
                          : Icons.remove_circle_rounded,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    label: Text(
                      icon == "mas" ? 'Agregar' : 'Eliminar',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      setState(() {
                        if (icon == "mas") {
                          widget.addItem(widget.data);
                          icon = "menos";
                        } else {
                          icon = "mas";
                          widget.removeItem(widget.data);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
