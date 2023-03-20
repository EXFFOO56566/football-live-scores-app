import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class FbBanneradsPage extends StatefulWidget {
  final String fbbannerid;
  const FbBanneradsPage({Key? key, required this.fbbannerid}) : super(key: key);

  @override
  State<FbBanneradsPage> createState() => _FbBanneradsPageState();
}

class _FbBanneradsPageState extends State<FbBanneradsPage> {
  Widget _currentAd = const SizedBox(
    height: 0,
    width: 0,
  );

  _showBannerAd() {
    setState(() {
      _currentAd = FacebookBannerAd(
        // placementId: "YOUR_PLACEMENT_ID",
        placementId:
            widget.fbbannerid, //testid
        bannerSize: BannerSize.STANDARD,
        listener: (result, value) {
          print("Banner Ad: $result -->  $value");
        },
      );
    });
  }

  @override
  void initState() {
    _showBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _currentAd;
  }
}
