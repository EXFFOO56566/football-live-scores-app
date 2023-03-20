import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/match.dart';
import 'Tabbar/Fixture/Tabbar/futurematch.dart';
import 'Tabbar/Fixture/Tabbar/livematch.dart';
import 'Tabbar/Fixture/Tabbar/recentmatch.dart';
import 'Tabbar/standing.dart';
import 'Tabbar/topscore.dart';

class LeaguedetailsPage extends StatefulWidget {
  final int leagueid;
  final int season;
  final String leaguename;
  const LeaguedetailsPage(
      {Key? key,
      required this.leagueid,
      required this.season,
      required this.leaguename})
      : super(key: key);

  @override
  _LeaguedetailsPageState createState() => _LeaguedetailsPageState();
}

class _LeaguedetailsPageState extends State<LeaguedetailsPage> {
  @override
  void initState() {
    Provider.of<MatchProvider>(context, listen: false)
        .getleaguefixture(leagueid: widget.leagueid, season: widget.season);
    Provider.of<MatchProvider>(context, listen: false)
        .getstanding(leagueid: widget.leagueid, season: widget.season);
    Provider.of<MatchProvider>(context, listen: false).gettopscore(leagueid: widget.leagueid,season: widget.season);
    // Provider.of<LeagueProvider>(context, listen: false)
    //     .getstanding(leagueid: widget.leagueid, season: widget.season);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 55,
          title: Text(widget.leaguename),
          bottom: TabBar(
            onTap: (value) {},
            tabs: const [
              Tab(
                child: Text("Live"),
              ),
              Tab(
                child: Text("Fixture"),
              ),
              Tab(
                child: Text("Recent"),
              ),
              Tab(
                child: Text("Standings"),
              ),
              Tab(
                child: Text("Top Score"),
              ),
            ],
            isScrollable: true,
          ),
        ),
        body: TabBarView(children: [
          LiveMatchPage(leagueid: widget.leagueid, season: widget.season),
          FutureMatchPage(leagueid: widget.leagueid, season: widget.season),
          RecentMatchPage(leagueid: widget.leagueid, season: widget.season),
          StandingPage(leagueid: widget.leagueid, season: widget.season),
          TopScorePage(leagueid: widget.leagueid, season: widget.season),
        ]),
      ),
    );
  }
}
