import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../LiveMatch/livematch2.dart';
import 'Fixture/onenextmatch.dart';
import 'Fixture/threenextmatch.dart';
import 'Fixture/todaymatch.dart';
import 'Fixture/twonextmatch.dart';
import 'Recent/onepreviousmatch.dart';
import 'Recent/threepreviousmatch.dart';
import 'Recent/twopreviousmatch.dart';

class Matchspage extends StatefulWidget {
  const Matchspage({Key? key}) : super(key: key);

  @override
  State<Matchspage> createState() => _MatchspageState();
}

class _MatchspageState extends State<Matchspage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  List<Tab> datetime = List.generate(
      7,
      (index) => Tab(
            text: DateFormat("dd MMM").format(DateTime.now()) ==
                    DateFormat("dd MMM").format(DateTime(DateTime.now().year,
                        DateTime.now().month, DateTime.now().day - 3 + index))
                ? "Today"
                : DateFormat("dd MMM").format(DateTime(DateTime.now().year,
                    DateTime.now().month, DateTime.now().day - 3 + index)),
          ));

  bool live = false;

  @override
  void initState() {
    _tabController = TabController(length: 7, vsync: this, initialIndex: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2023),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Match"),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
                child: Switch(
                  value: live,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      live = value;
                      _tabController!.animateTo(3);
                    });
                  },
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          tabs: datetime,
          controller: _tabController,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const ThreePreviousMatchPage(),
          const TwoPreviousMatchPage(),
          const OnePreviousMatchPage(),
          live == true ? const LiveMatch2() : const TodayMatchPage(),
          const OnenextMatchPage(),
          const TwonextMatchPage(),
          const ThreenextMatchPage(),
        ],
      ),
    );
  }
}
