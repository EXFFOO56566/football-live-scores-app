import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../Httpservice/ads.dart';
import '../../Model/Ads/ads.dart';
import '../../ads/InterstitialAd/showdas.dart';

class AdsProvider extends ChangeNotifier {
  Ads? ads;
  AppOpenAd? _appOpenAd;
  bool _isShowingAd = false;

  Future getads(BuildContext context) async {
    ads = await HttpAds().getads();
    adinit(context);
    notifyListeners();
  }

  Future adinit(BuildContext context) async {
    await Showads().initads(context);
  }

  bool get isAdAvailable {
    return _appOpenAd != null;
  }
}
