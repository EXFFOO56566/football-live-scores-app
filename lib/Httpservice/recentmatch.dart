
import 'package:football3/constent.dart';
import 'package:http/http.dart' as http;

import '../Model/LeaguebyMatch/leaguebymatch.dart';
import '../Model/Recentmatch/recentmatch.dart';

class Httprecentmatch {
  Future<List<RecentMatch>?> _getrecentmatch({String? date}) async {
    var headers = {'ab': token};
    var request = http.Request('GET',
        Uri.parse('$mainurl/fixtures/date=$date'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return recentMatchFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }

  List<RecentLeaguematch> recentleaguematch = [];

  Future<List<RecentLeaguematch>?> filterrecentmatch({String? date}) async {
    List<int> recentleagueid = [];
    recentleaguematch.clear();
    recentleagueid.clear();
    final recentmatch = await _getrecentmatch(date: date);
    for (var i = 0; i < recentmatch!.length; i++) {
      if (recentleagueid.contains(recentmatch[i].league!.id) == false) {
        recentleagueid.add(recentmatch[i].league!.id!);
      }
    }

    for (var i = 0; i < recentleagueid.length; i++) {
      recentleaguematch.add(RecentLeaguematch(
          leagueid: recentleagueid[i],
          allmatch: recentmatch
              .where((element) => element.league!.id == recentleagueid[i])
              .toList()));
    }
    return recentleaguematch;
  }
}
