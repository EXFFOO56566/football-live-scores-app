

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../Provider/Ads/ads.dart';
import 'googlenativeads.dart';

class Shownativeads extends StatefulWidget {
  final int indeex;
  const Shownativeads({Key? key, required this.indeex}) : super(key: key);

  @override
  State<Shownativeads> createState() => _ShownativeadsState();
}

class _ShownativeadsState extends State<Shownativeads> {
  Widget _nativeads = const SizedBox(
    height: 0,
    width: 0,
  );

  nativeads() {
    final adsinit = Provider.of<AdsProvider>(context, listen: false);
    if (adsinit.ads!.adsActive == 1 &&
        widget.indeex % adsinit.ads!.showNativeads! == 0) {
      _nativeads = Googlenativeadspage(
        googlenative: adsinit.ads!.gnative!,
      );
    }  else {
      _nativeads = const SizedBox(
        height: 0,
        width: 0,
      );
    }
  }

  @override
  void initState() {
    if (mounted) {
      nativeads();
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _nativeads;
  }
}
