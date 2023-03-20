import 'package:flutter/material.dart';

import '../Httpservice/youtube.dart';
import '../Model/Youtube/orginalyoutube.dart';
import '../Model/Youtube/youtube.dart';

class YoutubeProvider extends ChangeNotifier {
  Youtubeapidata? youtubelist;

  Future getyoutubelist() async {
    youtubelist = (await HttpYoutubeVideo().getyoutubelist())!;
    notifyListeners();
  }
}
