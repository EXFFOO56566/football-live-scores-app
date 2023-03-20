import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ExpensionRedio/customexpensition.dart';
import '../../../Provider/match.dart';

class TeamDetailsPage extends StatefulWidget {
  const TeamDetailsPage({Key? key}) : super(key: key);

  @override
  _TeamDetailsPageState createState() => _TeamDetailsPageState();
}

class _TeamDetailsPageState extends State<TeamDetailsPage> {
  bool loading = false;

  @override
  void initState() {
    // Provider.of<MatchdetailsProvier>(context, listen: false)
    //     .getplayerstatistics(widget.fixutreid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final livematch = Provider.of<MatchProvider>(context);
    return Scaffold(
      body: livematch.playerstatics.isEmpty
          ? const Center(
              child: Text(
                "No data Found",
                style: TextStyle(color: Colors.white),
              ),
            )
          : SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: livematch.playerstatics.length,
                itemBuilder: (context, index) {
                  var data = livematch.playerstatics[index];
                  return Column(
                    children: [
                      Card(
                        color: Colors.grey[900],
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                data.team!.logo!,
                                height: 30,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                data.team!.name!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      expansionPanellist(
                        children: List.generate(data.players!.length, (indexs) {
                          var data2 = data.players![indexs];

                          return expansionredio(
                            value: indexs.toString(),
                            name: data2.player!.name,
                            icon: Container(
                              padding: const EdgeInsets.all(5),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    NetworkImage(data2.player!.photo!),
                              ),
                            ),
                            body: GridView(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 2.2),
                              shrinkWrap: true,
                              children: [
                                playerbody(
                                    name: "pace",
                                    statistics: data2
                                        .statistics!.first.passes!.total
                                        .toString()),
                                playerbody(
                                    name: "dribbing",
                                    statistics: data2
                                        .statistics!.first.dribbles!.attempts
                                        .toString()),
                                playerbody(
                                    name: "shooting",
                                    statistics: data2
                                        .statistics!.first.shots!.total
                                        .toString()),
                                playerbody(
                                    name: "passing",
                                    statistics: data2
                                        .statistics!.first.passes!.total
                                        .toString()),
                                playerbody(
                                    name: "goal",
                                    statistics: data2.statistics!.first.goals!
                                                .total ==
                                            null
                                        ? '0'
                                        : data2.statistics!.first.goals!.total
                                            .toString()),
                                playerbody(
                                    name: "card",
                                    statistics: data2
                                        .statistics!.first.cards!.red
                                        .toString()),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget playerbody({String? name, statistics}) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 2,
      width: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            statistics,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            name!,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget expansionPanellist({List<CustomExpansionPanel>? children}) {
    return CustomExpansionPanelList.radio(
      elevation: 0,
      animationDuration: const Duration(milliseconds: 700),
      expandedHeaderPadding: EdgeInsets.zero,
      dividerColor: Colors.grey[900],
      children: children!,
    );
  }

  CustomExpansionPanelRadio expansionredio(
      {required Object value,
      required Widget body,
      Widget? icon,
      String? name}) {
    return CustomExpansionPanelRadio(
      canTapOnHeader: true,
      value: value,
      backgroundColor: Colors.grey[800],
      headerBuilder: (context, isExpanded) {
        return Container(
          margin: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              icon!,
              const SizedBox(width: 10),
              Text(
                name!,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
      body: body,
    );
  }

  Widget singlepage(
      {String? name,
      Widget? icon2,
      Color? textcolor,
      GestureTapCallback? onTap,
      EdgeInsetsGeometry? padding}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: padding ??
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Row(
            children: [
              const Icon(Icons.add_circle_outline_sharp),
              Container(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  name!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
