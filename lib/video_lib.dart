import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:video_strapi/video.dart';

class VideoLibrary extends StatefulWidget {
  const VideoLibrary({Key? key}) : super(key: key);

  @override
  _VideoLibraryState createState() => _VideoLibraryState();
}

class _VideoLibraryState extends State<VideoLibrary> {

  List<Video> video = [];
  Future getAll() async{
    var data = await http.get(Uri.parse('http://localhost:1337/api/videos/'));
    var jsonData = json.decode(data.body);
    for (var v in jsonData) {
      video.add(Video(v['id'], v['mane'], v['file']));
    }
    return video;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        color: Colors.black26,
        child: FutureBuilder(
            future: getAll(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data == null){
                return Container(child:Center(
                  child: Text("Loading..."),
                ));
              }else{
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context,int index){
                      return ListTile(
                        title: Text(snapshot.data[index].name),
                        subtitle: Text(snapshot.data[index].video),
                        //subtitle: Text(snapshot.data[index].email),
                        //onTap: (){
                         // Navigator.push(context,new MaterialPageRoute(builder: (context)=>MyDetail(snapshot.data[index])));
                        //},
                      );
                    }
                );}
            }
        ),
      ),
    );
  }
}
