import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoDetails extends StatefulWidget {
  const VideoDetails({Key? key}) : super(key: key);

  @override
  _VideoDetailsState createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        color: Colors.black26,
      ),
    );
  }
}
