
import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;

import '../Model/Headtohead/headtohead.dart';

class Httph2h {
  Future<List<HeadtoHead>?> getheadtohead({int? teamid1, int? teamid2}) async {
    
    var request = http.Request(
        'GET',
        Uri.parse(
            '$mainurl/fixtures/headtohead/h2h=${teamid2}-${teamid1}'));
    var headers = {'ab': token};

   
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return headtoheadFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
