import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_e_commerce/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("Users");

  addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUse(String uId) async {
    return await _userCollectionRef.doc(uId).get();
  }
}
