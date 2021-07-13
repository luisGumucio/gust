import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderHome extends StatefulWidget {
  const OrderHome({Key? key}) : super(key: key);
  @override
  _OrderHomeState createState() => _OrderHomeState();
}

class _OrderHomeState extends State<OrderHome> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        children: <Widget>[
          buildAppBar(),
          buildFoodFilter(),
          Expanded(child: buildContent())
        ],
      ),
    );
  }

  Widget buildAppBar() {
    int items = 0;
    return SafeArea(
      child: Row(
        children: <Widget>[
          Text('Filtrar',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Spacer(),
          IconButton(icon: Icon(Icons.tune), onPressed: () {}),
        ],
      ),
    );
  }

  Widget buildFoodFilter() {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: List.generate(FoodTypes.values.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              selectedColor: Color.fromRGBO(255, 204, 0, 1),
              labelStyle: TextStyle(
                  color: value == index ? Colors.white : Colors.black),
              label: Text(
                FoodTypes.values[index].toString().split('.').last,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              selected: value == index,
              onSelected: (selected) {
                setState(() {
                  value = index;
                });
              },
            ),
          );
        }),
      ),
    );
  }

  Widget buildContent() {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Card(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pedido No: xdsfs',
                            style: TextStyle(
                                fontSize: 21.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text('Total items: 45',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    Text('Precio Total: 45 bs',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 90,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 204, 0, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: new Center(
                              child: new Text(
                                "Pendiente",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            )),
                        InkWell(
                          onTap: () {},
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(12),
                          ),
                          child: Icon(Icons.delete_sweep, color: Colors.red),
                        )
                      ],
                    ),
                  ],
                ),
              ));
        });
  }

  Widget buildContent1() {
    final _items = <Order>[
      Order(
        id: 'id-1',
        date: DateTime.now(),
        number: 12,
        intemNo: 20,
        orderTotal: 20000,
        status: OrderStatus.inProgress,
      ),
      Order(
        id: 'id-2',
        date: DateTime.now().subtract(Duration(days: 10)),
        number: 10,
        intemNo: 2,
        orderTotal: 5000,
        status: OrderStatus.delivered,
      ),
      Order(
        id: 'id-2',
        date: DateTime.now().subtract(Duration(days: 10)),
        number: 10,
        intemNo: 2,
        orderTotal: 5000,
        status: OrderStatus.delivered,
      ),
      Order(
        id: 'id-2',
        date: DateTime.now().subtract(Duration(days: 10)),
        number: 10,
        intemNo: 2,
        orderTotal: 5000,
        status: OrderStatus.delivered,
      ),
      Order(
        id: 'id-2',
        date: DateTime.now().subtract(Duration(days: 10)),
        number: 10,
        intemNo: 2,
        orderTotal: 5000,
        status: OrderStatus.delivered,
      ),
      Order(
        id: 'id-2',
        date: DateTime.now().subtract(Duration(days: 10)),
        number: 10,
        intemNo: 2,
        orderTotal: 5000,
        status: OrderStatus.delivered,
      ),
    ];
    DateFormat dateFormate = DateFormat.yMd();
    return Container(
        child: ListView.separated(
      separatorBuilder: (context, index) => Divider(
        indent: 10.0,
        endIndent: 10.0,
        color: Colors.black,
      ),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        var item = _items[index];

        return Dismissible(
          direction: DismissDirection.startToEnd,
          key: Key(item.id),
          onDismissed: (dir) {
            setState(() => _items.removeAt(index));
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(dir == DismissDirection.startToEnd
                    ? '$item removed.'
                    : '$item liked.'),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    setState(() => _items.insert(index, item));
                  },
                ),
              ),
            );
          },
          background: Container(
            color: Colors.red,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.cancel),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Cancel \n Order',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            alignment: Alignment.centerLeft,
          ),
          child: ListTile(
            title: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Order No: ${item.number}',
                      ),
                      Text('items no: ${item.intemNo}'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Order Total: ${item.orderTotal}',
                      ),
                      Text(dateFormate.format(item.date)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StatusBar(
                    status: item.status,
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}

enum FoodTypes {
  Todos,
  Pendientes,
  Entregados,
  Cancelados,
  Hoy,
}

class StatusBar extends StatelessWidget {
  const StatusBar({Key? key, required this.status}) : super(key: key);

  final OrderStatus status;
  final List<String> titles = const [
    'waiting',
    'in progress',
    'delivering',
    'delivered'
  ];

  @override
  Widget build(BuildContext context) {
    var checkedCount = _getCheckedCount(status);
    var elements = List<bool>.generate(4, (i) => i < checkedCount);

    return Column(
      children: <Widget>[
        Stack(
          children: [
            Positioned(
              top: 25,
              left: 10,
              right: 10,
              child: Container(
                height: 4,
                color: Colors.black38,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: elements
                  .asMap()
                  .map((index, isChecked) => MapEntry(
                        index,
                        Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isChecked
                                    ? Colors.green
                                    : Colors.deepOrange,
                              ),
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              child: isChecked ? Icon(Icons.check) : null,
                            ),
                            Text(titles[index])
                          ],
                        ),
                      ))
                  .values
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }

  _getCheckedCount(OrderStatus status) {
    switch (status) {
      case OrderStatus.waiting:
        return 1;
      case OrderStatus.inProgress:
        return 2;
      case OrderStatus.deliviring:
        return 3;
      case OrderStatus.delivered:
        return 4;
    }
  }
}

class Order {
  final String id;
  final int number;
  final int intemNo;
  final int orderTotal;
  final DateTime date;
  final OrderStatus status;

  Order({
    required this.id,
    required this.number,
    required this.intemNo,
    required this.orderTotal,
    required this.date,
    required this.status,
  });
}

enum OrderStatus { waiting, inProgress, deliviring, delivered }
