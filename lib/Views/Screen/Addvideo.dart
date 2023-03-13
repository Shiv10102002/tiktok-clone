import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tictok/Views/Screen/add_caption_screen.dart';
import 'package:tictok/constraint.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});
  videopick(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("video selected", video.path);

      Get.to(() =>
          AddCaptionScreen(videoFIle: File(video.path), videoPath: video.path));
    } else {
      Get.snackbar("Error in selected video", "please select another video");
    }
  }

  showDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () => videopick(ImageSource.gallery),
                  child: const Text(
                    "Gallery",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => videopick(ImageSource.camera),
                  child: const Text(
                    "Camera",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () => showDialogBox(context),
        child: Container(
          width: 130,
          height: 40,
          decoration: BoxDecoration(
              color: buttoncolor, borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(
            "Upload video",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      )),
    );
  }
}
