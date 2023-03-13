import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tictok/model/video_model.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

class VideoUploadController extends GetxController {
  var uuid = Uuid();
  //upload video to firestor
  UploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      String id = uuid.v1();
      String videoUrl = await uploadVideoToStorage(id, videoPath);
      String thumbnail = await uploadVideoThumbToStorage(id, videoPath);
      video Video = video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: id,
        likes: [],
        commentcounts: 0,
        sharecount: 0,
        songname: songName,
        caption: caption,
        videoUrl: videoUrl,
        thumbnail: thumbnail,
        profilePic: (userDoc.data()! as Map<String, dynamic>)['profilePicture'],
      );

      await FirebaseFirestore.instance
          .collection("videos")
          .doc(id)
          .set(Video.tojson());
      Get.snackbar(
          "video uploaded successfully", "Thankyou for shareing your content");
    } catch (e) {
      Get.snackbar("Error uploading video", e.toString());
    }
  }
}

//generate thumbnail

Future<File> _getThumb(String videoPath) async {
  final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
  return thumbnail;
}

//upload thumbnail to firestore
Future<String> uploadVideoThumbToStorage(String Id, String videoPath) async {
  Reference reference =
      FirebaseStorage.instance.ref().child("videos").child(Id);
  UploadTask uploadTask = reference.putFile(await _getThumb(videoPath));
  TaskSnapshot snapshot = await uploadTask;
  String downloadurl = await snapshot.ref.getDownloadURL();
  return downloadurl;
}

//upload video to firestore
uploadVideoToStorage(String videoId, String videoPath) async {
  Reference reference =
      FirebaseStorage.instance.ref().child("videos").child(videoId);
  UploadTask uploadTask = reference.putFile(_compressVideo(videoPath));
  TaskSnapshot snapshot = await uploadTask;
  String downloadurl = await snapshot.ref.getDownloadURL();
  return downloadurl;
}

//compress video quality
_compressVideo(String videoPath) async {
  final compressVideo = await VideoCompress.compressVideo(videoPath,
      quality: VideoQuality.MediumQuality);
  return compressVideo!.file;
}
