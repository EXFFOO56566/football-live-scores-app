
import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;

import '../Model/Playerstatistics/player_statistics.dart';

class HttpPlayerstatistic {
  Future<List<Playerstatistics>?> getplayerstatistics(int fixutreid) async {
  var headers = {'ab': token};
    var request = http.Request('GET',
        Uri.parse('$mainurl/fixtures/players/fixtureid=$fixutreid'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return playerstatisticsFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
