import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Provider/match.dart';
import '../Matchdetails/matchdetails.dart';

class LiveMatch2 extends StatefulWidget {
  const LiveMatch2({Key? key}) : super(key: key);

  @override
  State<LiveMatch2> createState() => _LiveMatch2State();
}

class _LiveMatch2State extends State<LiveMatch2> {
  @override
  void initState() {
    Provider.of<MatchProvider>(context, listen: false).getlivematch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final livematch = Provider.of<MatchProvider>(context);
    return livematch.livematch.isEmpty
        ? const Center(
            child: Text(
              "Live Match Not Found",
              style: TextStyle(color: Colors.white),
            ),
          )
        : CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  var data = livematch.livematch[index];
                  return Container(
                    height: 50,
                    margin:
                        const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[800]!.withOpacity(0.5),
                    ),
                    child: InkWell(
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
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 70,
                                    child: Text(
                                      data.teams!.away['name'],
                                      maxLines: 1,
                                      textAlign: TextAlign.right,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  SizedBox(
                                    width: 25,
                                    height: 25,
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
                                    "${data.goals!.away ?? 0} : ${data.goals!.home ?? 0}",
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data.fixture!.status!.long!,
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 12),
                                  )
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                              Container(
                                width: 25,
                                height: 25,
                                child: Image.network(
                                  data.teams!.home['logo'],
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  data.teams!.home['name'],
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style:
                                      const TextStyle(color: Colors.white),
                                ),
                              ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
                }, childCount: livematch.livematch.length),
              )
            ],
          );
  }
}
