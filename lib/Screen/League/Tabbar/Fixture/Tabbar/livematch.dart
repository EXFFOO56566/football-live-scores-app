//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../Provider/match.dart';
import '../../../../Matchdetails/matchdetails.dart';

class LiveMatchPage extends StatefulWidget {
  final int leagueid;
  final int season;
  const LiveMatchPage({Key? key, required this.leagueid, required this.season})
      : super(key: key);

  @override
  State<LiveMatchPage> createState() => _LiveMatchPageState();
}

class _LiveMatchPageState extends State<LiveMatchPage> {
  @override
  Widget build(BuildContext context) {
    final livematch = Provider.of<MatchProvider>(context);
    var recentleague = livematch.leaguefixture
        .where((element) =>
            element.fixture!.status!.long != "Match Finished" &&
            element.fixture!.status!.long != "Not Started")
        .toList();
    recentleague
        .sort((a, b) => b.fixture!.timestamp!.compareTo(a.fixture!.timestamp!));
    return CustomScrollView(
      slivers: [
        recentleague.isEmpty
            ? const SliverToBoxAdapter()
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var data = recentleague[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                  fictureid: data.fixture!.id!,
                                  team1: data.teams!.away['id'],
                                  team2: data.teams!.home['id']),
                            ));
                      },
                      child: Container(
                        height: 50.h,
                        margin: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[800]!.withOpacity(0.5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 70.w,
                                      child: Text(
                                        data.teams!.away['name'],
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    SizedBox(
                                      width: 25.w,
                                      height: 25.h,
                                      child: Image.network(
                                        data.teams!.away['logo'],
                                        height: 30,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      DateFormat('HH:mm').format(
                                          DateTime.fromMicrosecondsSinceEpoch(
                                              data.fixture!.timestamp! *
                                                  100000)),
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      DateFormat('dd MMM, yyyy').format(
                                          DateTime.fromMicrosecondsSinceEpoch(
                                              data.fixture!.timestamp! *
                                                  1000000)),
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                )),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 25.w,
                                    height: 25.h,
                                    child: Image.network(
                                      data.teams!.home['logo'],
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  SizedBox(
                                    width: 70.w,
                                    child: Text(
                                      data.teams!.home['name'],
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: recentleague.length,
                ),
              ),
      ],
    );
  }
}
