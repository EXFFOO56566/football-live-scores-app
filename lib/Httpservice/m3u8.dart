import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;

import '../Model/M3u8/m3u8.dart';

class HttpM3u8 {
  Future<List<M3U8>?> getm3u8() async {
    var request = http.Request('GET', Uri.parse(livetv));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return m3U8FromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
