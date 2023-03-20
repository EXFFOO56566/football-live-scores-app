// To parse this JSON data, do
//
//     final youtubelist = youtubelistFromJson(jsonString);

import 'dart:convert';

List<Youtubelist> youtubelistFromJson(String str) => List<Youtubelist>.from(json.decode(str).map((x) => Youtubelist.fromJson(x)));

String youtubelistToJson(List<Youtubelist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Youtubelist {
    Youtubelist({
        this.id,
        this.youtubeid,
     
    });

    int? id;
    String? youtubeid;


    factory Youtubelist.fromJson(Map<String, dynamic> json) => Youtubelist(
        id: json["id"],
        youtubeid: json["youtubeid"],
 
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "youtubeid": youtubeid,
      
    };
}
