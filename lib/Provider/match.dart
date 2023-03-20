import 'package:flutter/material.dart';
import 'package:football3/Model/LiveMatch/livematch2.dart';
import '../Httpservice/custommatch.dart';
import '../Httpservice/league.dart';
import '../Httpservice/matchevent.dart';
import '../Httpservice/playerstatistic.dart';
import '../Httpservice/standing.dart';
import '../Httpservice/statistic.dart';
import '../Httpservice/topscore.dart';
import '../Model/All_League/all_league.dart';
import '../Model/CustomMatch/custommatch.dart';
import '../Model/LeagueFixture/leaguefixture.dart';
import '../Model/Lineup/lineup.dart';
import '../Httpservice/fixturematch.dart';
import '../Httpservice/h2h.dart';
import '../Httpservice/lineup.dart';
import '../Httpservice/livematch.dart';
import '../Httpservice/singlefixturematch.dart';
import '../Model/FutureMatch/futurematch.dart';
import '../Model/Headtohead/headtohead.dart';
import '../Model/MatchEvent/matchevent.dart';
import '../Model/Playerstatistics/player_statistics.dart';
import '../Model/SingleFixture/singlefixture.dart';
import '../Model/Standings/standings.dart';
import '../Model/Statistics/match_statistics.dart';
import '../Model/Top_Score/top_score.dart';

class MatchProvider extends ChangeNotifier {
  List<LiveMatch2> livematch = [];

  Future getlivematch() async {
    livematch = (await HttpLivematch().getlivematch())!;
    notifyListeners();
  }

  List<FutureMatch> fixturematch = [];

  Future getfixturematch({String? date}) async {
    fixturematch = (await HttpFixturmatch().getFutureMatch(date: date))!;
    
    notifyListeners();
  }

  List<Singlefixture> singlematch = [];

  Future getsinglematchinfo(int fixtureid) async {
    singlematch = (await HttpSinglefixture().getsinglefixture(fixtureid))!;
    notifyListeners();
  }

  List<HeadtoHead> h2h = [];

  Future geth2h({int? teamid1, int? teamid2}) async {
    h2h = (await Httph2h().getheadtohead(teamid1: teamid1, teamid2: teamid2))!;
    notifyListeners();
  }

  List<Lineup> lineup = [];

  Future getslineup(int fixtureid) async {
    lineup = (await Httplineup().getlineup(fixtureid))!;
    notifyListeners();
  }

  List<Matchstatistics> statistic = [];

  Future getstatis(int fixutreid) async {
    statistic = (await HttpStatistic().getmatchstatistics(fixutreid))!;
    notifyListeners();
  }

  List<Playerstatistics> playerstatics = [];

  Future getplayerstatics(int fixutreid) async {
    playerstatics =
        (await HttpPlayerstatistic().getplayerstatistics(fixutreid))!;
    notifyListeners();
  }

  List<Matchevent> matchevent = [];

  Future getmatchevent(int fixtureid) async {
    matchevent = (await Httpmatchevent().getmatchevent(fixtureid))!;
    notifyListeners();
  }

  List<Allleague> allleague = [];

  Future getallleague() async {
    allleague = (await HttpLeague().getallleague())!;
    notifyListeners();
  }

  List<Leaguefixture> leaguefixture = [];

  Future getleaguefixture({int? leagueid, int? season}) async {
    leaguefixture = (await HttpLeague()
        .getleaguefixture(leagueid: leagueid, season: season))!;
    notifyListeners();
  }

  List<Standings> standing = [];

  Future getstanding({int? leagueid, int? season}) async {
    standing =
        (await Httpstanding().getstanding(leagueid: leagueid, season: season))!;
    notifyListeners();
  }

  List<Topscore> topscore = [];

  Future gettopscore({int? leagueid, int? season}) async {
    topscore =
        (await Httptopscore().gettopscore(leagueid: leagueid, season: season))!;
    notifyListeners();
  }

  List<LiveMatch2>? custommatch = [];
  List<Allleague> customleague = [];

  Future getcustomlivematch(String? date, String status) async {
    var allleague = await HttpLeague().getallleague();
    custommatch = (await HttpLivematch().getlivematch())!;

    // var match = await HttpFixturmatch().getFutureMatch(date: date);
    customleague.clear();
    for (var i = 0; i < custommatch!.length; i++) {
      if (customleague.any(
              (element) => element.league!.id == custommatch![i].league!.id) ==
          true) {
        print("league allready added");
      } else {
        customleague.addAll(allleague!
            .where(
                (element) => element.league!.id == custommatch![i].league!.id)
            .toList());
      }
    }

    // if (status == "live") {
    //   for (var i = 0; i < leagueid!.live!.length; i++) {
    //     customleague.addAll(allleague!
    //         .where(
    //             (element) => element.league!.id == leagueid.live![i].leagueid)
    //         .toList());
    //     custommatch.addAll(match!
    //         .where(
    //             (element) => element.league!.id == leagueid.live![i].leagueid)
    //         .toList());
    //   }
    // } else {
    //   for (var i = 0; i < leagueid!.fixture!.length; i++) {
    //     customleague.addAll(allleague!
    //         .where((element) =>
    //             element.league!.id == leagueid.fixture![i].leagueid)
    //         .toList());
    //     custommatch.addAll(match!
    //         .where((element) =>
    //             element.league!.id == leagueid.fixture![i].leagueid)
    //         .toList());
    //   }
    // }
    notifyListeners();
  }
}
