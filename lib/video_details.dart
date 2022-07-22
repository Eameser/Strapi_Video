import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_strapi/video.dart';

class VideoDetails extends StatefulWidget {
  //const VideoDetails({Key? key}) : super(key: key);
  String? name;
  VideoPlayerController? controller;
  VideoDetails(this.name, this.controller);
  @override
  _VideoDetailsState createState() => _VideoDetailsState(this.name, this.controller);
}

class _VideoDetailsState extends State<VideoDetails> {
  String? name;
  VideoPlayerController? controller;
  _VideoDetailsState(this.name, this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Card(
          color: Colors.lime,
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 0)),
              Text(name!,
              style: TextStyle(fontSize: 32),),
              Container(
                width: 350,
                height: 300,
                child: controller!.value.isInitialized
                    ? VideoPlayer(controller!)
                    : Container(
                  //color: Colors.black,
                ),
              ),
              IconButton(
                  onPressed: () {
                    controller!.value.isPlaying
                        ? controller?.pause()
                        : controller?.play();
                  },
                  icon: Icon(controller!.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow))
            ],
          ),
        ),
      )
    );
  }
}
