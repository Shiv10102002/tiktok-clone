import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictok/Views/Screen/home_screen.dart';
import 'package:tictok/Views/Screen/login_screen.dart';
import 'package:tictok/model/user_model.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  // User reguster
  File? profImg;
  pickImage() async {
    // Pick an image
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    // Capture a photo
    // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    final img = File(image.path);
    profImg = img;
  }

  // state persistence
  late Rx<User?> _user;
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);
    //here Rx is observable keyword which continuosly check that variable is changing or not;
  }

  _setInitialView(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  void signUp(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadUrl = await _uploadProfpic(image);

        MyUser user = MyUser(
            name: username,
            ProfilePhoto: downloadUrl,
            email: email,
            uid: credential.user!.uid);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
            "Error creating account", "please enter all the required field");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error Occurred", e.toString());
    }
  }

  Future<String> _uploadProfpic(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("ProfilePicture")
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDownloadUrl = await snapshot.ref.getDownloadURL();
    return imageDownloadUrl;
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar("Errore Logging in", "Please enter required field");
      }
    } catch (e) {
      Get.snackbar("Errore Logging in ", e.toString());
    }
  }
}
