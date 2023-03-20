import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Provider/match.dart';

class Statisticspage extends StatefulWidget {
  const Statisticspage({Key? key}) : super(key: key);

  @override
  _StatisticspageState createState() => _StatisticspageState();
}

class _StatisticspageState extends State<Statisticspage> {
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    final livematch = Provider.of<MatchProvider>(context);
    return livematch.statistic.isEmpty
        ? const Center(
            child: Text(
              "No data Found",
              style:  TextStyle(color: Colors.white),
            ),
          )
        : SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              livematch.statistic.first.statistics!.length,
                          itemBuilder: (context, index) {
                            var data =
                                livematch.statistic.first.statistics![index];
                            return Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              margin: EdgeInsets.only(
                                  bottom: 30.h, top: index == 0 ? 28.h : 0.0),
                              alignment: Alignment.center,
                              child: const LinearProgressIndicator(
                                  value: 0.5,
                                  backgroundColor: Colors.grey,
                                  valueColor:  AlwaysStoppedAnimation<Color>(
                                      Colors.orange)),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              livematch.statistic.last.statistics!.length,
                          itemBuilder: (context, index) {
                            var data =
                                livematch.statistic.last.statistics![index];
                            return Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                data.type.toString(),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              livematch.statistic.first.statistics!.length,
                          itemBuilder: (context, index) {
                            var data =
                                livematch.statistic.first.statistics![index];
                            return Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              margin: EdgeInsets.only(
                                  bottom: 30.h, top: index == 0 ? 28.h : 0.0),
                              alignment: Alignment.center,
                              child: const LinearProgressIndicator(
                                  value: 0.5,
                                  backgroundColor: Colors.grey,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.orange)),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // Flexible(
                  //   child: Column(
                  //     children: [
                  //       ListView.builder(
                  //         physics: NeverScrollableScrollPhysics(),
                  //         shrinkWrap: true,
                  //         itemCount: livematch.statistic.last.statistics!.length,
                  //         itemBuilder: (context, index) {
                  //           var data = livematch.statistic.last.statistics![index];
                  //           return Container(
                  //             padding: EdgeInsets.all(10),
                  //             alignment: Alignment.center,
                  //             child: Text(
                  //               data.value.toString(),
                  //               style: TextStyle(color: Colors.white),
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          );
  }
}
