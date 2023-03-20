
import 'package:http/http.dart' as http;

import '../Model/News/news.dart';

class HttpnewsPage {
  Future<News?> getnewspage() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://starsportsofficial.com/apps/tsports_inc/football2/news.json'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return newsFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
