import 'package:flutter/material.dart';

class ClientOrderDetailItem extends StatefulWidget {
  const ClientOrderDetailItem({Key? key}) : super(key: key);

  @override
  _ClientOrderDetailItemState createState() => _ClientOrderDetailItemState();
}

class _ClientOrderDetailItemState extends State<ClientOrderDetailItem> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: Center(
              child: Container(
                width: 60.0,
                height: 60.0,
                child: FadeInImage(
                  image: NetworkImage(
                      'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/loading.gif'),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 100.0,
                  child: Text(
                    'Pechuga sdfdsf',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15.0,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '1',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 15.0,
                      )),
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: Text(
                        '\u20b9 12,000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              Container(
                child: DropdownButton(
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text("Kilos"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Cajas"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("Unidad"),
                        value: 3,
                      )
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                    hint: Text("Select item")),
              )
            ],
          ))
        ],
      ),
    ));
  }
}
