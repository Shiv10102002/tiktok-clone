import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  String name;
  String ProfilePhoto;
  String email;
  String uid;
  MyUser(
      {required this.name,
      required this.ProfilePhoto,
      required this.email,
      required this.uid});
      // used when data goes from app to firebase
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "ProfilePicture": ProfilePhoto,
      "email": email,
      "uid": uid
    };
  }
// used when date come from firebase to app
  static MyUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return MyUser(
      email: snapshot['email'],
      ProfilePhoto: snapshot['profilepicture'],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}
