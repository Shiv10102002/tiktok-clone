import 'package:flutter/material.dart';
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
                TikTokVideoPlayer(videoUrl: "",),
                Container(
                  margin: const EdgeInsets.only(bottom: 10,left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("@Username" ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                       Text("My Caption" ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                        Text("SongName" ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),)
                    ],
                  ),
                ),
                Container(
                  child: Column(children: [
                   
                  ]),
                )
              ],
            );
          }),
    );
  }
}
