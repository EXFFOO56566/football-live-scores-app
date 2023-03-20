import 'package:http/http.dart' as http;

import '../Model/CustomMatch/custommatch.dart';

class HttpCustommatch {
  Future<CustomMatch?> getcustommatch() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://raw.githubusercontent.com/tanvirmhamud/json1/v1/league.json'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return customMatchFromJson(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
