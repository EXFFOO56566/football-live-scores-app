import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Model/All_League/all_league.dart';
import '../../../Provider/match.dart';
import '../leaguedetails.dart';

class AllleaguePage extends StatefulWidget {
  const AllleaguePage({Key? key}) : super(key: key);

  @override
  _AllleaguePageState createState() => _AllleaguePageState();
}

class _AllleaguePageState extends State<AllleaguePage> {
  List<Allleague>? secoundleague = [];
  List<Allleague>? searchallleague = [];

  bool showsearchfield = false;

  void search(String value) {
    setState(() {
      searchallleague = secoundleague!
          .where(
              (element) => element.league!.name!.toLowerCase().contains(value))
          .toList();
    });
  }

  @override
  void initState() {
    Provider.of<MatchProvider>(context, listen: false).getallleague();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final livematch = Provider.of<MatchProvider>(context);
    secoundleague!.clear();
    secoundleague!.addAll(livematch.allleague);
    if (searchallleague!.isEmpty) {
      searchallleague!.clear();
      searchallleague!.addAll(livematch.allleague);
    }
    return Scaffold(
      appBar: AppBar(
        title: showsearchfield ? searchtextfield() : const Text("All League"),
        actions: [
          showsearchfield
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showsearchfield = false;
                    });
                  },
                  icon: const Icon(Icons.close))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      showsearchfield = true;
                    });
                  },
                  icon: const Icon(Icons.search))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              var data = searchallleague![index];
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => LeaguedetailsPage(
                                leagueid: data.league!.id!,
                                season: data.seasons!.last.year!,
                                leaguename: data.league!.name!,
                              )),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey[800]!.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: data.league!.logo != null
                                ? Image.network(
                                    data.league!.logo!,
                                    height: 30,
                                  )
                                : Container(),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            data.league!.name!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }, childCount: searchallleague!.length),
          )
        ],
      ),
    );
  }

  Widget searchtextfield() {
    return TextFormField(
      autofocus: true,
      onChanged: (value) {
        if (value.isNotEmpty) {
          search(value);
        } else {
          setState(() {
            searchallleague = secoundleague;
          });
        }
      },
      decoration: const InputDecoration(
        hintText: "Search League",
        border: InputBorder.none,
      ),
    );
  }
}
