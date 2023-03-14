import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  String name;
  String profilePhoto;
  String email;
  String uid;
  MyUser(
      {required this.name,
      required this.profilePhoto,
      required this.email,
      required this.uid});
  // used when data goes from app to firebase
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "ProfilePicture": profilePhoto,
      "email": email,
      "uid": uid
    };
  }

// used when date come from firebase to app
  static MyUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return MyUser(
      email: snapshot['email'],
      profilePhoto: snapshot['profilepicture'],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}
