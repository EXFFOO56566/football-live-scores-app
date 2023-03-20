// To parse this JSON data, do
//
//     final defaultleague = defaultleagueFromJson(jsonString);

import 'dart:convert';

List<Defaultleague> defaultleagueFromJson(String str) => List<Defaultleague>.from(json.decode(str).map((x) => Defaultleague.fromJson(x)));

String defaultleagueToJson(List<Defaultleague> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Defaultleague {
    Defaultleague({
        this.image,
        this.season,
        this.name,
        this.id,
    });

    String? image;
    int? season;
    String? name;
    int? id;

    factory Defaultleague.fromJson(Map<String, dynamic> json) => Defaultleague(
        image: json["image"],
        season: json["season"],
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "season": season,
        "name": name,
        "id": id,
    };
}
