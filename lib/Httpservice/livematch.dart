import 'dart:convert';

import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;

import '../Model/LeaguebyMatch/leaguebymatch.dart';
import '../Model/LiveMatch/livematch2.dart';

class HttpLivematch {
  // Stream<List<Leaguematch>?> streamlivematch(
  //     Duration refreshTime) async* {
  //   while (true) {
  //     await Future.delayed(refreshTime);
  //     yield await getleaguebymatch();
  //   }
  // }

  Future<List<LiveMatch2>?> getlivematch() async {
    var headers = {'ab': token};
    var request = http.Request('GET', Uri.parse('$mainurl/fixtures/live'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      
      return liveMatch2FromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
