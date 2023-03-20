import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football3/Screen/Matchdetails/matchdetails.dart';
import 'package:provider/provider.dart';

import '../../Provider/match.dart';

class LiveMatch extends StatefulWidget {
  const LiveMatch({Key? key}) : super(key: key);

  @override
  State<LiveMatch> createState() => _LiveMatchState();
}

class _LiveMatchState extends State<LiveMatch> {
  @override
  void initState() {
    Provider.of<MatchProvider>(context, listen: false).getlivematch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final livematch = Provider.of<MatchProvider>(context);
    return SliverToBoxAdapter(
      child: livematch.livematch.isEmpty
          ? Container()
          : SizedBox(
              height: 200.h,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Live Match",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 150.h,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: livematch.livematch.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        var data = livematch.livematch[index];
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
                                      border:
                                          Border.all(color: Colors.red[200]!),
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
                                    Image.network(data.teams!.away['logo'],
                                        height: 40),
                                    Image.network(data.teams!.home['logo'],
                                        height: 40)
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
                                          style: const TextStyle(color: Colors.white),
                                        )),
                                    Text(
                                      data.goals!.away.toString(),
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
                                          style: const TextStyle(color: Colors.white),
                                        )),
                                    Text(
                                      data.goals!.home.toString(),
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
            ),
    );
  }
}
