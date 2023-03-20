// To parse this JSON data, do
//
//     final ads = adsFromJson(jsonString);

import 'dart:convert';

Ads adsFromJson(String str) => Ads.fromJson(json.decode(str));

String adsToJson(Ads data) => json.encode(data.toJson());

class Ads {
    Ads({
        this.adsActive,
        this.adsClick,
        this.showNativeads,
        this.onesignalappid,
        this.gBanner,
        this.gInterstitial,
        this.gInterstitialVideo,
        this.gRewarded,
        this.gRewardedInterstitial,
        this.gnative,
        this.gIosBanner,
        this.gIosInterstitial,
        this.gIosInterstitialVideo,
        this.gIosRewarded,
        this.gIosRewardedInterstitial,
        this.gIosnative,
        this.biddingBanner,
        this.biddingInterstitial,
        this.biddingInterstitialVideo,
        this.biddingRewarded,
        this.biddingRewardedInterstitial,
        this.biddingNative,
        this.iosBiddingBanner,
        this.iosBiddingInterstitial,
        this.iosBiddingInterstitialVideo,
        this.iosBiddingRewarded,
        this.iosBiddingRewardedInterstitial,
        this.iosBiddingNative,
        this.fbBanner,
        this.fbInterstitial,
        this.fbInterstitialVideo,
        this.fbRewarded,
        this.fbRewardedInterstitial,
        this.fbNative,
        this.fbIosBanner,
        this.fbIosInterstitial,
        this.fbIosInterstitialVideo,
        this.fbIosRewarded,
        this.fbIosRewardedInterstitial,
        this.fbIosNative,
    });

    int? adsActive;
    int? adsClick;
    int? showNativeads;
    String? onesignalappid;
    String? gBanner;
    String? gInterstitial;
    String? gInterstitialVideo;
    String? gRewarded;
    String? gRewardedInterstitial;
    String? gnative;
    String? gIosBanner;
    String? gIosInterstitial;
    String? gIosInterstitialVideo;
    String? gIosRewarded;
    String? gIosRewardedInterstitial;
    String? gIosnative;
    String? biddingBanner;
    String? biddingInterstitial;
    String? biddingInterstitialVideo;
    String? biddingRewarded;
    String? biddingRewardedInterstitial;
    String? biddingNative;
    String? iosBiddingBanner;
    String? iosBiddingInterstitial;
    String? iosBiddingInterstitialVideo;
    String? iosBiddingRewarded;
    String? iosBiddingRewardedInterstitial;
    String ?iosBiddingNative;
    String? fbBanner;
    String?fbInterstitial;
    String? fbInterstitialVideo;
    String? fbRewarded;
    String? fbRewardedInterstitial;
    String?fbNative;
    String? fbIosBanner;
    String? fbIosInterstitial;
    String ?fbIosInterstitialVideo;
    String? fbIosRewarded;
    String? fbIosRewardedInterstitial;
    String? fbIosNative;

    factory Ads.fromJson(Map<String, dynamic> json) => Ads(
        adsActive: json["ads_active"],
        adsClick: json["ads_click"],
        showNativeads: json["show_nativeads"],
        onesignalappid: json["onesignalappid"],
        gBanner: json["GBanner"],
        gInterstitial: json["GInterstitial"],
        gInterstitialVideo: json["GInterstitial_Video"],
        gRewarded: json["GRewarded"],
        gRewardedInterstitial: json["GRewarded_Interstitial"],
        gnative: json["Gnative"],
        gIosBanner: json["GIosBanner"],
        gIosInterstitial: json["GIosInterstitial"],
        gIosInterstitialVideo: json["GIosInterstitial_Video"],
        gIosRewarded: json["GIosRewarded"],
        gIosRewardedInterstitial: json["GIosRewarded_Interstitial"],
        gIosnative: json["GIosnative"],
        biddingBanner: json["BiddingBanner"],
        biddingInterstitial: json["BiddingInterstitial"],
        biddingInterstitialVideo: json["BiddingInterstitial_Video"],
        biddingRewarded: json["BiddingRewarded"],
        biddingRewardedInterstitial: json["BiddingRewarded_Interstitial"],
        biddingNative: json["BiddingNative"],
        iosBiddingBanner: json["IosBiddingBanner"],
        iosBiddingInterstitial: json["IosBiddingInterstitial"],
        iosBiddingInterstitialVideo: json["IosBiddingInterstitial_Video"],
        iosBiddingRewarded: json["IosBiddingRewarded"],
        iosBiddingRewardedInterstitial: json["IosBiddingRewarded_Interstitial"],
        iosBiddingNative: json["IosBiddingNative"],
        fbBanner: json["FBBanner"],
        fbInterstitial: json["FBInterstitial"],
        fbInterstitialVideo: json["FBInterstitial_Video"],
        fbRewarded: json["FBRewarded"],
        fbRewardedInterstitial: json["FBRewarded_Interstitial"],
        fbNative: json["FbNative"],
        fbIosBanner: json["FBIosBanner"],
        fbIosInterstitial: json["FBIosInterstitial"],
        fbIosInterstitialVideo: json["FBIosInterstitial_Video"],
        fbIosRewarded: json["FBIosRewarded"],
        fbIosRewardedInterstitial: json["FBIosRewarded_Interstitial"],
        fbIosNative: json["FbIosNative"],
    );

    Map<String, dynamic> toJson() => {
        "ads_active": adsActive,
        "ads_click": adsClick,
        "show_nativeads": showNativeads,
        "onesignalappid": onesignalappid,
        "GBanner": gBanner,
        "GInterstitial": gInterstitial,
        "GInterstitial_Video": gInterstitialVideo,
        "GRewarded": gRewarded,
        "GRewarded_Interstitial": gRewardedInterstitial,
        "Gnative": gnative,
        "GIosBanner": gIosBanner,
        "GIosInterstitial": gIosInterstitial,
        "GIosInterstitial_Video": gIosInterstitialVideo,
        "GIosRewarded": gIosRewarded,
        "GIosRewarded_Interstitial": gIosRewardedInterstitial,
        "GIosnative": gIosnative,
        "BiddingBanner": biddingBanner,
        "BiddingInterstitial": biddingInterstitial,
        "BiddingInterstitial_Video": biddingInterstitialVideo,
        "BiddingRewarded": biddingRewarded,
        "BiddingRewarded_Interstitial": biddingRewardedInterstitial,
        "BiddingNative": biddingNative,
        "IosBiddingBanner": iosBiddingBanner,
        "IosBiddingInterstitial": iosBiddingInterstitial,
        "IosBiddingInterstitial_Video": iosBiddingInterstitialVideo,
        "IosBiddingRewarded": iosBiddingRewarded,
        "IosBiddingRewarded_Interstitial": iosBiddingRewardedInterstitial,
        "IosBiddingNative": iosBiddingNative,
        "FBBanner": fbBanner,
        "FBInterstitial": fbInterstitial,
        "FBInterstitial_Video": fbInterstitialVideo,
        "FBRewarded": fbRewarded,
        "FBRewarded_Interstitial": fbRewardedInterstitial,
        "FbNative": fbNative,
        "FBIosBanner": fbIosBanner,
        "FBIosInterstitial": fbIosInterstitial,
        "FBIosInterstitial_Video": fbIosInterstitialVideo,
        "FBIosRewarded": fbIosRewarded,
        "FBIosRewarded_Interstitial": fbIosRewardedInterstitial,
        "FbIosNative": fbIosNative,
    };
}
