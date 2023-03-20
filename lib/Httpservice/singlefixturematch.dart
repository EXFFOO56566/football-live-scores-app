
import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;

import '../Model/SingleFixture/singlefixture.dart';

class HttpSinglefixture {
  Future<List<Singlefixture>?> getsinglefixture(int fixtureid) async {
    var headers = {'ab': token};
    var request = http.Request(
        'GET', Uri.parse('$mainurl/fixtures/id=$fixtureid'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return singlefixtureFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
