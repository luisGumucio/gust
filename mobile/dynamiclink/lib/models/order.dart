import 'ItemOrder.dart';

class Order {
  late String UserId;
  late String date;
  late List<ItemOrder> itemOrders;
  Order() {
    itemOrders = [];
  }

  Map toJson() => {'UserId': UserId, 'date': date, 'itemOrders': itemOrders};
}
