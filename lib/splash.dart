import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Mainscreen/mainscreen.dart';
import 'Provider/Ads/ads.dart';
import 'Provider/youtube.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Future loadalldata() async {
    await Provider.of<AdsProvider>(context, listen: false).getads(context);
     await Provider.of<YoutubeProvider>(context, listen: false).getyoutubelist();
  }

  @override
  void initState() {
    loadalldata().then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const MAinScreenpage())));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "images/721990480d1f30f45c862cecad967e2d.gif",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
