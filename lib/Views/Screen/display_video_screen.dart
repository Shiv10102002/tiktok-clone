import 'package:flutter/material.dart';
import 'package:tictok/Views/Widgets/albom_icon.dart';
import 'package:tictok/Views/Widgets/pofile_button.dart';
import 'package:tictok/Views/Widgets/tiktio_video_player.dart';

class DisplayVideoScreen extends StatelessWidget {
  const DisplayVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                TikTokVideoPlayer(
                  videoUrl: "",
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "@Username",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "My Caption",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "SongName",
                        style: TextStyle(
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
                          profilePicUrl: "ADD",
                        ),
                        Column(
                          children: const [
                            Icon(
                              Icons.favorite,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              "Like",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(
                              Icons.reply,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              "Share",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(
                              Icons.comment,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              "Comments",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
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
          }),
    );
  }
}
