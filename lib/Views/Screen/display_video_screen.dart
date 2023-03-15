import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictok/Views/Widgets/albom_icon.dart';
import 'package:tictok/Views/Widgets/pofile_button.dart';
import 'package:tictok/Views/Widgets/tiktio_video_player.dart';
import 'package:tictok/controller/video_controller.dart';

class DisplayVideoScreen extends StatelessWidget {
  DisplayVideoScreen({super.key});
  final VideoController videoController = Get.put(VideoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return PageView.builder(
          reverse: true,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemCount: videoController.videoList.length,
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            return Stack(
              children: [
                TikTokVideoPlayer(
                  videoUrl: data.videoUrl,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.username,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data.caption,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data.songname,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 400,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 2.5,
                        right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileButton(
                          profilePicUrl: data.profilePic,
                        ),
                        InkWell(
                          onTap: () {
                            videoController.likedVideo(data.id);
                          },
                          child: Column(
                            children: [
                              const Icon(
                                Icons.favorite,
                                size: 40,
                                color: Colors.pinkAccent,
                              ),
                              Text(
                                data.likes.length.toString(),
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.reply,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              data.sharecount.toString(),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.comment,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              data.commentcounts.toString(),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                        AlbomIcon(
                          albumUrl: "ada",
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          });
    }));
  }
}
