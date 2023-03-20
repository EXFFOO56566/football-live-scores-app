import 'dart:io';
import 'dart:math';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';

import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';

import '../../Provider/Ads/ads.dart';
import '../../Provider/Ads/interstitialad.dart';

class Showads {
  Future initads(BuildContext context) async {
    final adsinit = Provider.of<AdsProvider>(context, listen: false);
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId(adsinit.ads!.onesignalappid!);
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      if (kDebugMode) {
        print("Accepted permission: $accepted");
      }
    });
    if (adsinit.ads!.adsActive == 1) {
      MobileAds.instance.initialize();
      Provider.of<InterstitialadPage>(context, listen: false).initState(
          Platform.isAndroid
              ? adsinit.ads!.gInterstitial!
              : adsinit.ads!.gIosInterstitial!);
    } else if (adsinit.ads!.adsActive == 2) {
      FacebookAudienceNetwork.init(
        iOSAdvertiserTrackingEnabled: true,
      );
      Provider.of<InterstitialadPage>(context, listen: false)
          .loadfbInterstitialAd(Platform.isAndroid
              ? adsinit.ads!.fbInterstitial!
              : adsinit.ads!.fbIosInterstitial!);
    } else if (adsinit.ads!.adsActive == 3) {
      MobileAds.instance.initialize();
      Provider.of<InterstitialadPage>(context, listen: false).initState(
          Platform.isAndroid
              ? adsinit.ads!.biddingInterstitial!
              : adsinit.ads!.iosBiddingInterstitial!);
    }
  }

  void showads(BuildContext context) {
    final adsinit = Provider.of<AdsProvider>(context, listen: false);
    if (adsinit.ads!.adsActive == 1 && clickads(context) == true) {
      var rng = Random();
      Provider.of<InterstitialadPage>(context, listen: false)
          .showInterstitialAd(Platform.isAndroid
              ? rng.nextInt(10).isOdd
                  ? adsinit.ads!.gInterstitialVideo!
                  : adsinit.ads!.gInterstitial!
              : rng.nextInt(10).isOdd
                  ? adsinit.ads!.gIosInterstitialVideo!
                  : adsinit.ads!.gIosInterstitial!);
    } else if (adsinit.ads!.adsActive == 2 && clickads(context) == true) {
      Provider.of<InterstitialadPage>(context, listen: false)
          .showfbInterstitialAd();
    } else if (adsinit.ads!.adsActive == 3 && clickads(context) == true) {
      var rng = Random();
      Provider.of<InterstitialadPage>(context, listen: false)
          .showInterstitialAd(Platform.isAndroid
              ? rng.nextInt(10).isOdd
                  ? adsinit.ads!.biddingInterstitialVideo!
                  : adsinit.ads!.biddingInterstitial!
              : rng.nextInt(10).isOdd
                  ? adsinit.ads!.iosBiddingInterstitialVideo!
                  : adsinit.ads!.iosBiddingInterstitial!);
    }
  }

  bool clickads(BuildContext context) {
    final adsinit = Provider.of<AdsProvider>(context, listen: false);
    var box = Hive.box('ads');
    int clickads = box.get('click') ?? 0;
    if (clickads % adsinit.ads!.adsClick! == 0) {
      if (kDebugMode) {
        print(true);
      }
      box.put('click', clickads + 1);
      return true;
    } else {
      if (kDebugMode) {
        print(false);
      }
      box.put('click', clickads + 1);
      return false;
    }
  }

  void instentadsshow(BuildContext context, int index) {
    final adsinit = Provider.of<AdsProvider>(context, listen: false);
    if (adsinit.ads!.adsActive == 1) {
      var rng = Random();
      Provider.of<InterstitialadPage>(context, listen: false)
          .showInterstitialAd(Platform.isAndroid
              ? rng.nextInt(10).isOdd
                  ? adsinit.ads!.gInterstitialVideo!
                  : adsinit.ads!.gInterstitial!
              : rng.nextInt(10).isOdd
                  ? adsinit.ads!.gIosInterstitialVideo!
                  : adsinit.ads!.gIosInterstitial!);
    } else if (adsinit.ads!.adsActive == 2) {
      Provider.of<InterstitialadPage>(context, listen: false)
          .showfbInterstitialAd();
    } else if (adsinit.ads!.adsActive == 3) {
      var rng = Random();
      Provider.of<InterstitialadPage>(context, listen: false)
          .showInterstitialAd(Platform.isAndroid
              ? rng.nextInt(10).isOdd
                  ? adsinit.ads!.biddingInterstitialVideo!
                  : adsinit.ads!.biddingInterstitial!
              : rng.nextInt(10).isOdd
                  ? adsinit.ads!.iosBiddingInterstitialVideo!
                  : adsinit.ads!.iosBiddingInterstitial!);
    }
  }

  void showonlyvideoads(BuildContext context) {
    final adsinit = Provider.of<AdsProvider>(context, listen: false);
    if (adsinit.ads!.adsActive == 1) {
      Provider.of<InterstitialadPage>(context, listen: false).showRewardedAd(
          Platform.isAndroid
              ? adsinit.ads!.gRewarded!
              : adsinit.ads!.gIosRewarded!);
    }
  }
}
