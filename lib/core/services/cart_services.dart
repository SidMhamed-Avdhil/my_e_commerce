import 'package:cloud_firestore/cloud_firestore.dart';

class CartServices {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Carts');
}
