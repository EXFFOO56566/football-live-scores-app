// To parse this JSON data, do
//
//     final lineup = lineupFromJson(jsonString);

import 'dart:convert';

List<Lineup> lineupFromJson(String str) =>
    List<Lineup>.from(json.decode(str).map((x) => Lineup.fromJson(x)));

String lineupToJson(List<Lineup> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lineup {
  Lineup({
    this.team,
    this.coach,
    this.formation,
    this.startXi,
    this.substitutes,
  });

  Team? team;
  Coach? coach;
  String? formation;
  List<StartXi>? startXi;
  List<StartXi>? substitutes;

  factory Lineup.fromJson(Map<String, dynamic> json) => Lineup(
        team: Team.fromJson(json["team"]),
        coach: Coach.fromJson(json["coach"]),
        formation: json["formation"],
        startXi:
            List<StartXi>.from(json["startXI"].map((x) => StartXi.fromJson(x))),
        substitutes: List<StartXi>.from(
            json["substitutes"].map((x) => StartXi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "team": team!.toJson(),
        "coach": coach!.toJson(),
        "formation": formation,
        "startXI": List<dynamic>.from(startXi!.map((x) => x.toJson())),
        "substitutes": List<dynamic>.from(substitutes!.map((x) => x.toJson())),
      };
}

class Coach {
  Coach({
    this.id,
    this.name,
    this.photo,
  });

  int? id;
  String? name;
  String? photo;

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
      };
}

class StartXi {
  StartXi({
    this.player,
  });

  Player? player;

  factory StartXi.fromJson(Map<String, dynamic> json) => StartXi(
        player: Player.fromJson(json["player"]),
      );

  Map<String, dynamic> toJson() => {
        "player": player!.toJson(),
      };
}

class Player {
  Player({
    this.id,
    this.name,
    this.number,
    this.pos,
    this.grid,
  });

  int? id;
  String? name;
  int? number;
  String? pos;
  String? grid;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        pos: json["pos"],
        grid: json["grid"] == null ? null : json["grid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number": number,
        "pos": pos,
        "grid": grid == null ? null : grid,
      };
}

class Team {
  Team({
    this.id,
    this.name,
    this.logo,
    // this.colors,
  });

  int? id;
  String? name;
  String? logo;
  // Colors? colors;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        // colors: Colors.fromJson(json["colors"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        // "colors": colors!.toJson(),
      };
}

class Colorss {
  Colorss({
    this.player,
    this.goalkeeper,
  });

  Goalkeeper? player;
  Goalkeeper? goalkeeper;

  factory Colorss.fromJson(Map<String, dynamic> json) => Colorss(
        player: Goalkeeper.fromJson(json["player"]),
        goalkeeper: Goalkeeper.fromJson(json["goalkeeper"]),
      );

  Map<String, dynamic> toJson() => {
        "player": player!.toJson(),
        "goalkeeper": goalkeeper!.toJson(),
      };
}

class Goalkeeper {
  Goalkeeper({
    this.primary,
    this.number,
    this.border,
  });

  String? primary;
  String? number;
  String? border;

  factory Goalkeeper.fromJson(Map<String, dynamic> json) => Goalkeeper(
        primary: json["primary"],
        number: json["number"],
        border: json["border"],
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "number": number,
        "border": border,
      };
}
