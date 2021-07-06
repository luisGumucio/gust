class ItemOrder {
  late String itemId;
  late String orderType;
  late String name;
  late int amount;
  late double price;

  Map toJson() => {
        'itemId': itemId,
        'orderType': orderType,
        'name': name,
        'amount': amount,
        'price': price
      };
}
