
import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;

import '../Model/Standings/standings.dart';

class Httpstanding {
  Future<List<Standings>?> getstanding({int? leagueid, int? season}) async {
    var headers = {'ab': token};
    var request = http.Request(
        'GET',
        Uri.parse(
            '$mainurl//standings/league=$leagueid/season=$season'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return standingsFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
