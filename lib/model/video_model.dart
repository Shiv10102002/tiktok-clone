import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String username;
  String uid;
  String id;
  List likes;
  int commentcounts;
  int sharecount;
  String songname;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePic;

  Video(
      {required this.username,
      required this.uid,
      required this.id,
      required this.likes,
      required this.commentcounts,
      required this.sharecount,
      required this.songname,
      required this.caption,
      required this.videoUrl,
      required this.thumbnail,
      required this.profilePic});

  Map<String, dynamic> tojson() => {
        "username": username,
        "uid": uid,
        "id": id,
        "likes": likes,
        "commentcounts": commentcounts,
        "sharcount": sharecount,
        "songname": songname,
        "caption": caption,
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,
        "profilePic": profilePic,
      };

  static Video fromSnap(DocumentSnapshot snap) {
    var sst = snap.data() as Map<String, dynamic>;
    return Video(
        username: sst["username"],
        uid: sst["uid"],
        id: sst["id"],
        likes: sst["likes"],
        commentcounts: sst["commentcounts"],
        sharecount: sst["sharecount"],
        songname: sst["songname"],
        caption: sst["caption"],
        videoUrl: sst["videoUrl"],
        thumbnail: sst["thumbnail"],
        profilePic: sst["profilePic"]);
  }
}
