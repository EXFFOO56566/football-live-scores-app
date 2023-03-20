import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Model/Lineup/lineup.dart';
import '../../../Provider/match.dart';

class LineUpPage extends StatefulWidget {
  const LineUpPage({Key? key}) : super(key: key);

  @override
  _LineUpPageState createState() => _LineUpPageState();
}

class _LineUpPageState extends State<LineUpPage> {

  @override
  Widget build(BuildContext context) {
    final livematch = Provider.of<MatchProvider>(context);

    return SingleChildScrollView(
      child: livematch.lineup.isEmpty
          ? const Center(
              child: Text(
                "No data Found",
                style:  TextStyle(color: Colors.white),
              ),
            )
          : Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('images/playground.png', fit: BoxFit.cover),
              livematch.lineup.first.formation != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        lineupdraw(livematch.lineup),
                        const SizedBox(height: 30),
                        secoundlineupdrasw(livematch.lineup),
                      ],
                    )
                  : Container(),
            ],
          ),
    );
  }

  Widget lineupdraw(List<Lineup>? value) {
    var formetdata = value!.first.formation!.split("-");
    formetdata.insert(0, '1');
    return Column(
      children: List.generate(formetdata.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: int.parse(formetdata[index]),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, rowindex) {
                    return SizedBox(
                      width: 70,
                      child: Lineupplayer(
                        value: value,
                        columindex: index,
                        rowindex: rowindex,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget secoundlineupdrasw(List<Lineup>? value) {
    var formetdata = value!.last.formation!.split("-");
    formetdata.insert(0, '1');
    var reversdata = formetdata.reversed.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        reversdata.length,
        (index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    reverse: true,
                    itemCount: int.parse(reversdata[index]),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, rowindex) {
                      return SizedBox(
                        width: 70,
                        child: Secoundlineupplayer(
                          value: value,
                          columindex: index,
                          rowindex: rowindex,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class Lineupplayer extends StatefulWidget {
  final List<Lineup>? value;
  final int columindex;
  final int rowindex;
  const Lineupplayer(
      {Key? key,
      required this.columindex,
      required this.rowindex,
      required this.value})
      : super(key: key);

  @override
  _LineupplayerState createState() => _LineupplayerState();
}

class _LineupplayerState extends State<Lineupplayer> {
  String? lineupgrid;
  @override
  void initState() {
    lineupgrid = '${widget.columindex + 1}:${widget.rowindex + 1}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = widget.value!.first.startXi!
        .where((element) => element.player!.grid == lineupgrid)
        .toList();
    return SizedBox(
      height: 82,
      child: Column(
        children: [
          Image.asset(
            'images/lineup_img.png',
            height: 30,
          ),
          Text(
            data.first.player!.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class Secoundlineupplayer extends StatefulWidget {
  final List<Lineup>? value;
  final int columindex;
  final int rowindex;
  const Secoundlineupplayer(
      {Key? key,
      required this.columindex,
      required this.rowindex,
      required this.value})
      : super(key: key);

  @override
  _SecoundlineupplayerState createState() => _SecoundlineupplayerState();
}

class _SecoundlineupplayerState extends State<Secoundlineupplayer> {
  String? lineupgrid;
  @override
  void initState() {
    lineupgrid = '${widget.columindex + 1}:${widget.rowindex + 1}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = widget.value!.last.startXi!
        .where((element) => element.player!.grid == lineupgrid)
        .toList();

    return SizedBox(
      height: 70,
      width: 150,
      child: Column(
        children: [
          Image.asset(
            'images/lineup_img.png',
            height: 30,
          ),
          data.isEmpty
              ? const Text(
                  "M. ....",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:  TextStyle(fontSize: 12, color: Colors.white),
                )
              : Text(
                  data.first.player!.name ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                )
        ],
      ),
    );
  }
}
