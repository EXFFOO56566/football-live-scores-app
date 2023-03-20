
import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;

import '../Model/MatchEvent/matchevent.dart';

class Httpmatchevent {
  Future<List<Matchevent>?> getmatchevent(int fixtureid) async {
   var headers = {'ab': token};
    var request = http.Request('GET',
        Uri.parse('$mainurl/fixtures/events/fixtureid=$fixtureid'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return matcheventFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
