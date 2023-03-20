// To parse this JSON data, do
//
//     final customMatch = customMatchFromJson(jsonString);

import 'dart:convert';

CustomMatch customMatchFromJson(String str) => CustomMatch.fromJson(json.decode(str));

String customMatchToJson(CustomMatch data) => json.encode(data.toJson());

class CustomMatch {
    CustomMatch({
        this.live,
        this.fixture,
    });

    List<Fixture>? live;
    List<Fixture>? fixture;

    factory CustomMatch.fromJson(Map<String, dynamic> json) => CustomMatch(
        live: List<Fixture>.from(json["live"].map((x) => Fixture.fromJson(x))),
        fixture: List<Fixture>.from(json["fixture"].map((x) => Fixture.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "live": List<dynamic>.from(live!.map((x) => x.toJson())),
        "fixture": List<dynamic>.from(fixture!.map((x) => x.toJson())),
    };
}

class Fixture {
    Fixture({
        this.id,
        this.leagueid,
    });

    int? id;
    int ?leagueid;

    factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json["id"],
        leagueid: json["leagueid"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "leagueid": leagueid,
    };
}
