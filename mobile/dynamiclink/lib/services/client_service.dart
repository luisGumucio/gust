import 'package:cloud_firestore/cloud_firestore.dart';

class ClientService {
  final CollectionReference clients =
      FirebaseFirestore.instance.collection('clients');

  Future<QuerySnapshot> getAllClients() {
    return clients.get();
  }
}
