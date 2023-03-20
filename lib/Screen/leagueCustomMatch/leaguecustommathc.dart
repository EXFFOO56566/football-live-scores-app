import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Model/FutureMatch/futurematch.dart';
import '../../Model/LiveMatch/livematch2.dart';
import '../../Provider/match.dart';
import '../Matchdetails/matchdetails.dart';

class LeagueCustomMatch extends StatefulWidget {
  final String status;
  final String data;
  const LeagueCustomMatch({Key? key, required this.status, required this.data})
      : super(key: key);

  @override
  State<LeagueCustomMatch> createState() => _LeagueCustomMatchState();
}

class _LeagueCustomMatchState extends State<LeagueCustomMatch> {
  int select = 09898794445;
  List<LiveMatch2> custommatch = [];

  Future getcustommatch({String? leagueid}) async {
    final livematch = Provider.of<MatchProvider>(context, listen: false);

    if (leagueid == null) {
      setState(() {
        custommatch = livematch.custommatch!;
      });
    } else {
      setState(() {
        custommatch = livematch.custommatch!
            .where((element) => element.league!.id == int.parse(leagueid))
            .toList();
      });
    }
  }

  @override
  void initState() {
    Provider.of<MatchProvider>(context, listen: false)
        .getcustomlivematch(widget.data, widget.status)
        .then((value) => getcustommatch(leagueid: null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final livematch = Provider.of<MatchProvider>(context);

    return livematch.custommatch!.isEmpty
        ? Container()
        : SizedBox(
            height: 200.h,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                SizedBox(
                  height: 35.h,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: livematch.customleague.length,
                      itemBuilder: ((context, index) {
                        var data = livematch.customleague[index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              select = index;
                            });
                            getcustommatch(
                                leagueid: data.league!.id!.toString());
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            margin: EdgeInsets.only(
                                right: 10.w, left: index == 0 ? 10.w : 0.0),
                            decoration: BoxDecoration(
                                color: select == index
                                    ? Colors.indigoAccent.withOpacity(0.5)
                                    : Colors.grey[800]!.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              data.league!.name!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      })),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: custommatch.length,
                    itemBuilder: ((context, index) {
                      var data = custommatch[index];
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
                          height: 150.h,
                          width: 120.w,
                          margin: const EdgeInsets.only(left: 15),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[800]!.withOpacity(0.5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red[200]!),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  data.fixture!.status!.long!,
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 35.h,
                                    width: 35.h,
                                    child: Image.network(
                                      data.teams!.away['logo'],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35.h,
                                    width: 35.h,
                                    child: Image.network(
                                        data.teams!.home['logo'],
                                        height: 40),
                                  )
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 80.w,
                                      height: 20.h,
                                      child: Text(
                                        data.teams!.away['name'],
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                  Text(
                                    "${data.goals!.away ?? 0}",
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 80.w,
                                      height: 20.h,
                                      child: Text(
                                        data.teams!.home['name'],
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                  Text(
                                    "${data.goals!.home ?? "0"}",
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          );
  }
}
