import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../Model/Top_Score/top_score.dart';
import '../../../Provider/match.dart';

class TopScorePage extends StatefulWidget {
  final int leagueid;
  final int season;
  const TopScorePage({Key? key, required this.leagueid, required this.season})
      : super(key: key);

  @override
  _TopScorePageState createState() => _TopScorePageState();
}

class _TopScorePageState extends State<TopScorePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final livematch = Provider.of<MatchProvider>(context);
    return livematch.topscore.isEmpty
        ? const Center(
            child: Text(
              "No data Found",
              style: TextStyle(color: Colors.white),
            ),
          )
        : SingleChildScrollView(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              listtopscore(livematch.topscore),
            ],
          ));
  }

  Widget listtopscore(List<Topscore>? value) {
    return FittedBox(
      child: DataTable(
        columnSpacing: 20,
        columns: const [
          DataColumn(
              label: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          )),
          DataColumn(label: Text('Age', style: TextStyle(color: Colors.white))),
          DataColumn(
              label: Text('Goals', style: TextStyle(color: Colors.white))),
          DataColumn(
              label: Text('Assists', style: TextStyle(color: Colors.white))),
        ],
        rows: List.generate(value!.length, (index) {
          var data = value[index];
          return DataRow(cells: [
            DataCell(
              SizedBox(
                width: 170,
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundImage: NetworkImage(data.player!.photo!)),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Text(data.player!.name!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
            ),
            DataCell(SizedBox(
                width: 20,
                child: Text(data.player!.age.toString(),
                    style: TextStyle(color: Colors.white)))),
            DataCell(Text(data.statistics![0].goals!.total.toString(),
                style: TextStyle(color: Colors.white))),
            DataCell(Text(data.statistics![0].goals!.assists.toString(),
                style: TextStyle(color: Colors.white))),
          ]);
        }),
      ),
    );
  }
}
