import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const int maxFailedLoadAttempts = 3;

class InterstitialadPage extends ChangeNotifier {
  static const AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;

  void initState(String adUnitId) {
    _createInterstitialAd(adUnitId);
  }

  void rewardinit(String adunitid) {
    _createRewardedAd(adunitid);
  }

  void _createInterstitialAd(String adUnitId) {
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          if (kDebugMode) {
            print('$ad loaded');
          }
          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          _interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          if (kDebugMode) {
            print('InterstitialAd failed to load: $error.');
          }
          _numInterstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
            _createInterstitialAd(adUnitId);
          }
        },
      ),
    );
    notifyListeners();
  }

  void showInterstitialAd(String adUnitId) {
    if (_interstitialAd == null) {
      if (kDebugMode) {
        print('Warning: attempt to show interstitial before loaded.');
      }
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        if (kDebugMode) {
          print('ad onAdShowedFullScreenContent.');
        }
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        if (kDebugMode) {
          print('$ad onAdDismissedFullScreenContent.');
        }
        ad.dispose();
        _createInterstitialAd(adUnitId);
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd(adUnitId);
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
    notifyListeners();
  }

  void disposes() {
    _interstitialAd?.dispose();
  }

  //reward ads

  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;

  void _createRewardedAd(String adunitid) {
    RewardedAd.load(
      adUnitId: adunitid,
      request: request,
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          if (kDebugMode) {
            print('$ad loaded.');
          }
          _rewardedAd = ad;
          notifyListeners();
        },
        onAdFailedToLoad: (LoadAdError error) {
          if (kDebugMode) {
            print('RewardedAd failed to load: $error');
          }
          _rewardedAd = null;
          _numRewardedLoadAttempts += 1;
          if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
            _createRewardedAd(adunitid);
          }
        },
      ),
    );
  }

  void showRewardedAd(String adunitid) {
    if (_rewardedAd == null) {
      if (kDebugMode) {
        print('Warning: attempt to show rewarded before loaded.');
      }
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) {
        if (kDebugMode) {
          print('ad onAdShowedFullScreenContent.');
        }
      },
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        if (kDebugMode) {
          print('$ad onAdDismissedFullScreenContent.');
        }
        ad.dispose();
        _createRewardedAd(adunitid);
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        if (kDebugMode) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
        }
        ad.dispose();
        _createRewardedAd(adunitid);
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      if (kDebugMode) {
        print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
      }
    });
    _rewardedAd = null;

    notifyListeners();
  }

  // facebook ads

  bool _fbisInterstitialAdLoaded = false;
  void loadfbInterstitialAd(String placementid) {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: placementid,
      listener: (result, value) {
        if (kDebugMode) {
          print(">> FAN > Interstitial Ad: $result --> $value");
        }
        if (result == InterstitialAdResult.LOADED) {
          _fbisInterstitialAdLoaded = true;
        }
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _fbisInterstitialAdLoaded = false;
          loadfbInterstitialAd(placementid);
        }
      },
    );
  }

  showfbInterstitialAd() {
    if (_fbisInterstitialAdLoaded == true) {
      FacebookInterstitialAd.showInterstitialAd();
    } else if (kDebugMode) {
      print("Interstial Ad not yet loaded!");
    }
  }
}
