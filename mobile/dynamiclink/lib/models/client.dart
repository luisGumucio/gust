class Client {
  late String telegramId;
  late String name;

  Map toJson() => {'telegramId': telegramId, 'name': name};
}
