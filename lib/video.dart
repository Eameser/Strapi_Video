import 'package:http/http.dart' as http;

class Video {
  var client = http.Client();
  //var remoteUrl = '$baseUrl/api/videos';

  int? id;
  String? name;
  String? video;
  //Video({required this.id, required this.name, required this.video});
  Video(this.id, this.name, this.video);

  //Future<dynamic>
}