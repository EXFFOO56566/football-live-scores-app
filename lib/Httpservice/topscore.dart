import 'package:http/http.dart' as http;

import '../Model/Top_Score/top_score.dart';

class Httptopscore {
  Future<List<Topscore>?> gettopscore({int? leagueid, int? season}) async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://app.fbgoals.com/api/top-score?leagueid=${leagueid}&season=${season}'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return topscoreFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
