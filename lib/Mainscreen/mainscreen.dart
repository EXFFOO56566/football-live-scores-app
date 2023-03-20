// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football3/Screen/League/Allleague/allleague.dart';
import 'package:football3/Screen/M3u8/m3u8.dart';
import '../Screen/Drawer/drawer.dart';
import '../Screen/Homepage/home.dart';
import '../Screen/Match/matchs.dart';
import '../ads/AnchoredAdaptiveads/showbannerads.dart';
import '../ads/InterstitialAd/showdas.dart';

class MAinScreenpage extends StatefulWidget {
  const MAinScreenpage({Key? key}) : super(key: key);

  @override
  State<MAinScreenpage> createState() => _MAinScreenpageState();
}

class _MAinScreenpageState extends State<MAinScreenpage> {
  final PageController _pageController = PageController();

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: const DrawerPage(),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ShowBannerAds(),
            Container(
              color: Colors.grey[900],
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      _pageController.jumpToPage(0);
                      Showads().showads(context);
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          Text(
                            "Home",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _pageController.jumpToPage(1);
                      Showads().showads(context);
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: Image.asset(
                                "images/football1.png",
                                color: Colors.white,
                              )),
                          Text(
                            "Match",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _pageController.jumpToPage(2);
                      Showads().showads(context);
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.h,
                            child: Image.asset(
                              "images/podium.png",
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "League",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _pageController.jumpToPage(3);
                      Showads().showads(context);
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.h,
                            child: Image.asset(
                              "images/video-camera.png",
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Video",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _key.currentState!.openEndDrawer();
                      Showads().showads(context);
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          Text(
                            "Menu",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: const [HomePage(), Matchspage(), AllleaguePage(), M3u8Page()],
      ),
    );
  }
}
