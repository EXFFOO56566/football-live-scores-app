

import 'package:http/http.dart' as http;

import '../Model/Defaultleague/defaultleague.dart';

class Favleague {
  Future<List<Defaultleague>?> _getleague() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://starsportsofficial.com/apps/tsports_inc/football2/league.json'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return defaultleagueFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
  }

