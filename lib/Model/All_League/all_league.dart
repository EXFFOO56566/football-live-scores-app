// To parse this JSON data, do
//
//     final allleague = allleagueFromJson(jsonString);

import 'dart:convert';

List<Allleague> allleagueFromJson(String str) => List<Allleague>.from(json.decode(str).map((x) => Allleague.fromJson(x)));

String allleagueToJson(List<Allleague> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Allleague {
    Allleague({
        this.league,
        this.country,
        this.seasons,
    });

    League? league;
    Country? country;
    List<Season>? seasons;

    factory Allleague.fromJson(Map<String, dynamic> json) => Allleague(
        league: League.fromJson(json["league"]),
        country: Country.fromJson(json["country"]),
        seasons: List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "league": league!.toJson(),
        "country": country!.toJson(),
        "seasons": List<dynamic>.from(seasons!.map((x) => x.toJson())),
    };
}

class Country {
    Country({
        this.name,
        this.code,
        this.flag,
    });

    String? name;
    dynamic code;
    dynamic flag;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        flag: json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "flag": flag,
    };
}

class League {
    League({
        this.id,
        this.name,
        this.type,
        this.logo,
    });

    int? id;
    String? name;
    String? type;
    String? logo;

    factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "logo": logo,
    };
}

class Season {
    Season({
        this.year,
        this.start,
        this.end,
        this.current,
    });

    int? year;
    DateTime? start;
    DateTime? end;
    bool? current;

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        year: json["year"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        current: json["current"],
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "start": "${start!.year.toString().padLeft(4, '0')}-${start!.month.toString().padLeft(2, '0')}-${start!.day.toString().padLeft(2, '0')}",
        "end": "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
        "current": current,
    };
}
