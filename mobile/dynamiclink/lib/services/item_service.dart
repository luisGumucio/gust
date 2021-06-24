import 'package:cloud_firestore/cloud_firestore.dart';

class ItemService {
  final CollectionReference items =
      FirebaseFirestore.instance.collection('items');

  Future<QuerySnapshot> getAllRooms() {
    return items.get();
  }
}
