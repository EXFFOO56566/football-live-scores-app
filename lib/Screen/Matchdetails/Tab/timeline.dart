import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/match.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final livematch = Provider.of<MatchProvider>(context);
    return livematch.matchevent.isEmpty
        ? const Center(
            child: Text(
              "No Data Found",
              style: TextStyle(color: Colors.white),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: livematch.matchevent.length,
            itemBuilder: (context, index) {
              var data = livematch.matchevent[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Flexible(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if ((index + 1).isOdd)
                          Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Text(
                                data.player!.name ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white),
                              ))
                      ],
                    )),
                    SizedBox(
                        width: 30,
                        child: Row(
                          children: [
                            if (data.type == 'Goal')
                              const Icon(
                                Icons.sports_soccer_outlined,
                                color: Colors.white,
                              ),
                            if (data.type == 'Card')
                              const Icon(
                                Icons.card_giftcard,
                                color: Colors.white,
                              ),
                            if (data.type == 'subst')
                              const Icon(
                                Icons.subtitles_sharp,
                                color: Colors.white,
                              ),
                          ],
                        )),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if ((index + 1).isEven)
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Text(
                                data.player!.name ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white),
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
