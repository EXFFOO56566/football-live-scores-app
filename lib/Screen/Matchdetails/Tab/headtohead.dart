// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../Model/LiveMatch/livematch2.dart';
import '../../../Provider/match.dart';

class HeadtoHeadPage extends StatefulWidget {
  const HeadtoHeadPage({
    Key? key,
  }) : super(key: key);

  @override
  _HeadtoHeadPageState createState() => _HeadtoHeadPageState();
}

class _HeadtoHeadPageState extends State<HeadtoHeadPage> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final livematch = Provider.of<MatchProvider>(context);
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var data = livematch.h2h[index];

              return InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[800]!.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              DateFormat('dd MMM, yyyy')
                                  .format(data.fixture!.date!),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 70.w,
                                        child: Text(
                                          data.teams!.away['name'],
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(color: Colors.white),
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
                                  ))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "${data.goals!.away ?? 0} : ${data.goals!.home ?? 0}",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
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
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )))
                            ],
                          ),
                          const Divider()
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: livematch.h2h.length,
          ),
        ),
      ],
    );
  }
}

class Leaguematch {
  Leaguematch({
    this.leagueid,
    this.allmatch,
  });

  int? leagueid;
  List<LiveMatch2>? allmatch;
}
