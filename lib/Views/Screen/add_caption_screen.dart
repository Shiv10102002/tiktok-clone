import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictok/Views/Widgets/textinput_field.dart';
import 'package:tictok/constraint.dart';
import 'package:tictok/controller/upload_video_controller.dart';
import 'package:video_player/video_player.dart';

class AddCaptionScreen extends StatefulWidget {
  File videoFIle;
  String videoPath;
  AddCaptionScreen(
      {super.key, required this.videoFIle, required this.videoPath});

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

class _AddCaptionScreenState extends State<AddCaptionScreen> {
  late VideoPlayerController videoPlayerController;
  VideoUploadController videoUploadController =
      Get.put(VideoUploadController());
  final TextEditingController songnameController = TextEditingController();
  final TextEditingController captionController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFIle);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              child: VideoPlayer(videoPlayerController),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextinputField(
                      controller: songnameController,
                      myLabelText: "song name",
                      myIcon: Icons.music_note),
                  const SizedBox(
                    height: 20,
                  ),
                  TextinputField(
                      controller: captionController,
                      myLabelText: "caption",
                      myIcon: Icons.closed_caption),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      VideoUploadController.uploadVideo(songnameController.text,
                          captionController.text, widget.videoPath);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: buttoncolor),
                    child: const Text("Upload"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
