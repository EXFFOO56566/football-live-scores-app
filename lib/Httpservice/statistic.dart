
import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;

import '../Model/Statistics/match_statistics.dart';

class HttpStatistic {
  Future<List<Matchstatistics>?> getmatchstatistics(int fixutreid) async {
    var headers = {'ab': token};
    var request = http.Request('GET',
        Uri.parse('$mainurl/fixtures/statistics/fixtureid==$fixutreid'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return matchstatisticsFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
