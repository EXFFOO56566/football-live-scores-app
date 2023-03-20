
import 'package:http/http.dart' as http;

import '../Model/MatchVideo/matchvideo.dart';

class Httpmatchvideo {
  Future<MatchVideo?> getmatchvideo() async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('https://app.fbgoals.com/api/match/video'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return matchVideoFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
