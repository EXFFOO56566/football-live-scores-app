// To parse this JSON data, do
//
//     final matchevent = matcheventFromJson(jsonString);

import 'dart:convert';

List<Matchevent> matcheventFromJson(String str) => List<Matchevent>.from(json.decode(str).map((x) => Matchevent.fromJson(x)));

String matcheventToJson(List<Matchevent> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Matchevent {
    Matchevent({
        this.time,
        this.team,
        this.player,
        this.assist,
        this.type,
        this.detail,
        this.comments,
    });

    Time? time;
    Team? team;
    Assist? player;
    Assist? assist;
    String? type;
    String? detail;
    dynamic comments;

    factory Matchevent.fromJson(Map<String, dynamic> json) => Matchevent(
        time: Time.fromJson(json["time"]),
        team: Team.fromJson(json["team"]),
        player: Assist.fromJson(json["player"]),
        assist: Assist.fromJson(json["assist"]),
        type: json["type"],
        detail: json["detail"],
        comments: json["comments"],
    );

    Map<String, dynamic> toJson() => {
        "time": time!.toJson(),
        "team": team!.toJson(),
        "player": player!.toJson(),
        "assist": assist!.toJson(),
        "type": type,
        "detail": detail,
        "comments": comments,
    };
}

class Assist {
    Assist({
        this.id,
        this.name,
    });

    int? id;
    String? name;

    factory Assist.fromJson(Map<String, dynamic> json) => Assist(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
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

class Time {
    Time({
        this.elapsed,
        this.extra,
    });

    int? elapsed;
    dynamic extra;

    factory Time.fromJson(Map<String, dynamic> json) => Time(
        elapsed: json["elapsed"],
        extra: json["extra"],
    );

    Map<String, dynamic> toJson() => {
        "elapsed": elapsed,
        "extra": extra,
    };
}
