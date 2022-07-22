import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client;
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_strapi/video.dart';
import 'package:video_strapi/video_details.dart';

import 'VideoDataModule.dart';

class VideoLibrary extends StatefulWidget {
  const VideoLibrary({Key? key}) : super(key: key);

  @override
  _VideoLibraryState createState() => _VideoLibraryState();
}

class _VideoLibraryState extends State<VideoLibrary> {
  //List<Video> vids = [];
  VideoPlayerController? _controller;
  VideoPlayerController? _controller2;
  VideoPlayerController? _controller3;

  @override
  void initState() {
    _controller = VideoPlayerController.network('http://localhost:1337/uploads/osees_funeral_solution_3807377973.mp4?updated_at=2022-07-20T11:53:02.716Z.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller?.play();
        });
      });

    _controller2 = VideoPlayerController.network('http://localhost:1337/uploads/bill_evans_waltz_for_debby_ae53ddb2ae.mp4?updated_at=2022-07-20T11:53:01.978Z.mp4')
      ..initialize().then((_) {});

    _controller3 = VideoPlayerController.network('http://localhost:1337/uploads/blur_coffee_and_TV_25670aa2cc.mp4?updated_at=2022-07-20T11:53:03.184Z.mp4')
      ..initialize().then((_) {});

    super.initState();
  }


  final Client _client = Client();
  Future<VideoDataModule> fetchObjectsList() async {
    final response = await _client.get(Uri.parse(
        'http://192.168.1.241:1337/api/videos/'));
    if (response.statusCode == 200) {
      print(response.body);
      return VideoDataModule.fromJson(json.decode(response.body));
    } else {
      return VideoDataModule();
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              iconSize: 30,
            color: Colors.lime,
              onPressed: () {},
              icon: const Icon(Icons.search)),
        ],
        leading: IconButton(
            iconSize: 30,
            color: Colors.lime,
            onPressed: () {},
            icon: const Icon(Icons.notifications_rounded)),
        title: Text('Video'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.white70],
            stops: [0.5, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        //color: Colors.black26,
        child: FutureBuilder(
            future: fetchObjectsList(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              VideoDataModule? data = snapshot.data;
              //print(snapshot.data);
              if(snapshot.hasData){
                print(snapshot.data);
                return ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.lime,
                          child: Column(
                            children: [
                              Container(
                                width: 350,
                                height: 300,
                                child: _controller!.value.isInitialized
                                    ? VideoPlayer(_controller!)
                                    : Container(
                                  //color: Colors.black,
                                ),
                              ),
                                    //Spacer(),
                                    ListTile(
                                      title: Text('${data?.data![index].attributes?.name}'),
                                      //subtitle: Text(snapshot.data[index].video),
                                      //subtitle: Text(snapshot.data[index].email),
                                      onTap: (){
                                        Navigator.push(context,new MaterialPageRoute(builder: (context)=>VideoDetails(data?.data![index].attributes?.name, _controller)));
                                      },
                                    ),
                            ],
                          ),
                        ),
                      );
                    }
                );
              }
              else
              {
                return Center(child: CircularProgressIndicator(
                  color: Colors.lime,
                ));
                }
            }
        ),
      ),
    );
  }

  /*Widget content() {
    return Center(
      child: Container(
        width: 350,
        height: 300,
        child: _controller!.value.isInitialized
            ? VideoPlayer(_controller!)
            : Container(),
      ),
    );
  }*/

}
