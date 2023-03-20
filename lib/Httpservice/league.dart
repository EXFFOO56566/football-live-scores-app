
import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;

import '../Model/All_League/all_league.dart';
import '../Model/LeagueFixture/leaguefixture.dart';

class HttpLeague {
  Future<List<Allleague>?> getallleague() async {
   var headers = {'ab': token};
    var request = http.Request(
        'GET', Uri.parse('$mainurl/leagues/current=true'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return allleagueFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }




  Future<List<Leaguefixture>?> getleaguefixture({int? leagueid, int? season}) async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://app.fbgoals.com/api/season-league-fixture?leagueid=$leagueid&season=$season'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return leaguefixtureFromJson(responsedata.body);
     
    } else {
      print(responsedata.body);
     
    }
  }
}
