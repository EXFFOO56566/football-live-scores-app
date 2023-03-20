
import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;
import '../Model/Ads/ads.dart';

class HttpAds {
  Future<Ads?> getads() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            adsurl));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return adsFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
