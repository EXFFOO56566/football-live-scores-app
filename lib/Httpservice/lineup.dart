
import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;

import '../Model/Lineup/lineup.dart';

class Httplineup {
  Future<List<Lineup>?> getlineup(int fixtureid) async {
    var headers = {'ab': token};
    var request = http.Request('GET',
        Uri.parse('$mainurl/fixtures/lineups/fixtureid=$fixtureid'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return lineupFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
