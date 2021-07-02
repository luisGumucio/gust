import 'package:flutter/material.dart';

class AdminCardNotification extends StatefulWidget {
  final String name;
  final String extraInformation;
  final Function(Object) addItem;
  final Function(Object) removeItem;
  final Object data;
  const AdminCardNotification(
      {Key? key,
      required this.name,
      required this.extraInformation,
      required this.data,
      required this.addItem,
      required this.removeItem})
      : super(key: key);

  @override
  _AdminCardNotificationState createState() => _AdminCardNotificationState();
}

class _AdminCardNotificationState extends State<AdminCardNotification> {
  bool itemStatus = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Wrap(
          children: [
            Container(
              height: 80,
              padding: EdgeInsets.only(top: 10),
              child: Center(child: Image.asset('assets/pecho.jpeg')),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.extraInformation,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.yellow[900])),
                      GestureDetector(
                        child: Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                              color: Colors.green[600],
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Icon(
                            itemStatus == true ? Icons.add : Icons.remove,
                            color: Colors.white,
                            size: 18.0,
                          ),
                        ),
                        onTap: () {
                          if (itemStatus) {
                            setState(() {
                              itemStatus = false;
                              widget.addItem(widget.data);
                            });
                          } else {
                            setState(() {
                              itemStatus = true;
                              widget.removeItem(widget.data);
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
