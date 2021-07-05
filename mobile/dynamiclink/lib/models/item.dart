class Item {
  late String id;
  late String name;
  late double price;

  Map toJson() => {'id': id, 'name': name, 'price': price};

  toItem(Map? data) {}
}
