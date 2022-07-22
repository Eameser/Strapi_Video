import 'package:http/http.dart' as http;

class Video {

  int? id;
  String? name;
  String? video;
  //Video({required this.id, required this.name, required this.video});
  Video({this.id, this.name, this.video});
  static List<Video> vidInfo = [];
  //Future<dynamic>
}