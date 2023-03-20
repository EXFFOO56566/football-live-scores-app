import 'dart:convert';

import 'package:football3/constent.dart';

import '../Model/Youtube/orginalyoutube.dart';
import '../Model/Youtube/youtube.dart';
import 'package:http/http.dart' as http;

class HttpYoutubeVideo {
  Future<Youtubeapidata?> getyoutubelist() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            youtube));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<Youtubelist> youtubelist =
          youtubelistFromJson(await response.stream.bytesToString());
      List<String> id = [];
      for (var v in youtubelist) {
        id.add(v.youtubeid!);
      }
      var data = id.join(",");
      return await getorginalyoutubedata(data);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<Youtubeapidata?> getorginalyoutubedata(var data) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics&id=$data&key=AIzaSyC9ITAyLsNOjlqwiyKC693PWE-Kb2eZAUM'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return youtubeapidataFromJson(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
