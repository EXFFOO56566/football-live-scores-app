import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;

import '../Model/FutureMatch/futurematch.dart';
import '../Model/LeaguebyMatch/leaguebymatch.dart';

class HttpFixturmatch {
  Future<List<FutureMatch>?> getFutureMatch({String? date}) async {
    
    var request =
        http.Request('GET', Uri.parse('$mainurl/fixtures/date=$date'));
    var headers = {'ab': token};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return futureMatchFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
