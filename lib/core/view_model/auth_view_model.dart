import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/core/services/firestore_user.dart';
import 'package:my_e_commerce/helper/local_storage_data.dart';
import 'package:my_e_commerce/model/user_model.dart';
import 'package:my_e_commerce/view/control_view.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? email, password, name;
  Rx<User?> _user = Rx.new(null);
  final LocalStorageData localStorageData = Get.find();

  String? get user => _user.value?.email;
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print(googleUser);
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await _auth.signInWithCredential(credential).then((user) async {
        saveUser(user);
        Get.offAll(ControlView());
      });
    } on PlatformException catch (e) {
      Get.snackbar(
        "Sign-in error",
        "$e",
        colorText: textColor,
        backgroundColor: Colors.red,
      );
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((value) async {
        await FireStoreUser()
            .getCurrentUse(value.user!.uid)
            .then((value) async {
          // ignore: unnecessary_null_comparison
          if (value != null && value.data() != null) {
            final userData = value.data() as Map<dynamic, dynamic>;
            setUser(UserModel.fromJson(userData));
          } else {
            print("User document found but lacks required fields.");
          }
        });
      });
      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar(
        "Error login account",
        "$e",
        colorText: textColor,
        backgroundColor: Colors.red,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
        Get.offAll(ControlView());
      });
    } catch (e) {
      print(e);
      Get.snackbar(
        "Error login account",
        "$e",
        colorText: textColor,
        backgroundColor: Colors.red,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: name == null ? user.user!.displayName : name,
      image: user.user!.photoURL,
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
