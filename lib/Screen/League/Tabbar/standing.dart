import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../Model/Standings/standings.dart';
import '../../../Provider/match.dart';

class StandingPage extends StatefulWidget {
  final int leagueid;
  final int season;
  const StandingPage({Key? key, required this.leagueid, required this.season})
      : super(key: key);

  @override
  _StandingPageState createState() => _StandingPageState();
}

class _StandingPageState extends State<StandingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final livematch = Provider.of<MatchProvider>(context);
    return livematch.standing.isEmpty
        ? const Center(
            child: Text(
              "No data Found",
              style: TextStyle(color: Colors.white),
            ),
          )
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(padding: const EdgeInsets.all(10), child: const Text('p')),
                  Container(padding: const EdgeInsets.all(10), child: const Text('GD')),
                  Container(padding: const EdgeInsets.all(10), child: const Text('PTS'))
                ],
              ),
              const Divider(),
              Flexible(
                child: ListView.builder(
                  itemCount:
                      livematch.standing.first.league!.standings!.first.length,
                  itemBuilder: (context, index) {
                    var data = livematch
                        .standing.first.league!.standings!.first[index];
                    return allstanding(data);
                  },
                ),
              ),
            ],
          );
  }

  Widget allstanding(Standing data) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                data.team!.logo!,
                height: 25,
              ),
              const SizedBox(width: 10),
              Text(data.team!.name!),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(data.points.toString())),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(data.goalsDiff.toString())),
                  Container(padding: const EdgeInsets.all(10), child: const Text('PTS'))
                ],
              )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
