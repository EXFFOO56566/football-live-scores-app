// To parse this JSON data, do
//
//     final matchstatistics = matchstatisticsFromJson(jsonString);

import 'dart:convert';

List<Matchstatistics> matchstatisticsFromJson(String str) => List<Matchstatistics>.from(json.decode(str).map((x) => Matchstatistics.fromJson(x)));

String matchstatisticsToJson(List<Matchstatistics> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Matchstatistics {
    Matchstatistics({
        this.team,
        this.statistics,
    });

    Team? team;
    List<Statistic>? statistics;

    factory Matchstatistics.fromJson(Map<String, dynamic> json) => Matchstatistics(
        team: Team.fromJson(json["team"]),
        statistics: List<Statistic>.from(json["statistics"].map((x) => Statistic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "team": team!.toJson(),
        "statistics": List<dynamic>.from(statistics!.map((x) => x.toJson())),
    };
}

class Statistic {
    Statistic({
        this.type,
        this.value,
    });

    String? type;
    dynamic value;

    factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        type: json["type"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
    };
}

class Team {
    Team({
        this.id,
        this.name,
        this.logo,
    });

    int? id;
    String? name;
    String? logo;

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
    };
}
