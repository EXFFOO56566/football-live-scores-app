// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../Provider/match.dart';
import '../FixtureMatch/fixturematch.dart';
import '../YoutubeVideo/youtube.dart';
import '../leagueCustomMatch/leaguecustommathc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String? imageurl;
  bool loading = false;
  bool isExpanded = false;

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    Provider.of<MatchProvider>(context, listen: false)
        .getfixturematch(date: DateFormat('yyyy-MM-dd').format(DateTime.now()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xFF1E2023),
      // drawer: DrawerPage(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Deshboard",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child:  YoutubeVideoPage(),
              ),
              SliverToBoxAdapter(
                child: LeagueCustomMatch(
                    status: 'live',
                    data: DateFormat("yyyy-MM-dd").format(DateTime.now())),
              ),
              // LiveMatch(),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Today Fixture",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const FixtureMatch(),
            ],
          ),
        ],
      ),
    );
  }
}
