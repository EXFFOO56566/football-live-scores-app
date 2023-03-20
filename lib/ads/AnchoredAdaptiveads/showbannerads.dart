import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/Ads/ads.dart';
import 'fbbannerads.dart';
import 'googlebannerads.dart';

class ShowBannerAds extends StatefulWidget {
  const ShowBannerAds({Key? key}) : super(key: key);

  @override
  State<ShowBannerAds> createState() => _ShowBannerAdsState();
}

class _ShowBannerAdsState extends State<ShowBannerAds> {
  Widget _bannerads = const SizedBox(
    height: 0,
    width: 0,
  );

  bannerads() {
    final adsinit = Provider.of<AdsProvider>(context, listen: false);
    if (adsinit.ads!.adsActive == 1) {
      _bannerads = AnchoredAdaptiveExample(
        googlebannerid: Platform.isAndroid
            ? adsinit.ads!.gBanner!
            : adsinit.ads!.gIosBanner!,
      );
    } else if (adsinit.ads!.adsActive == 2) {
      _bannerads = FbBanneradsPage(
        fbbannerid: Platform.isAndroid
            ? adsinit.ads!.fbBanner!
            : adsinit.ads!.fbIosBanner!,
      );
    } else if (adsinit.ads!.adsActive == 3) {
      _bannerads = AnchoredAdaptiveExample(
        googlebannerid: Platform.isAndroid
            ? adsinit.ads!.biddingBanner!
            : adsinit.ads!.iosBiddingBanner!,
      );
    } else {
      _bannerads = const SizedBox(
        height: 0,
        width: 0,
      );
    }
  }

  @override
  void initState() {
    bannerads();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _bannerads;
  }
}
