// To parse this JSON data, do
//
//     final playerstatistics = playerstatisticsFromJson(jsonString);

import 'dart:convert';

List<Playerstatistics> playerstatisticsFromJson(String str) => List<Playerstatistics>.from(json.decode(str).map((x) => Playerstatistics.fromJson(x)));

String playerstatisticsToJson(List<Playerstatistics> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Playerstatistics {
    Playerstatistics({
        this.team,
        this.players,
    });

    Team? team;
    List<PlayerElement>? players;

    factory Playerstatistics.fromJson(Map<String, dynamic> json) => Playerstatistics(
        team: Team.fromJson(json["team"]),
        players: List<PlayerElement>.from(json["players"].map((x) => PlayerElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "team": team!.toJson(),
        "players": List<dynamic>.from(players!.map((x) => x.toJson())),
    };
}

class PlayerElement {
    PlayerElement({
        this.player,
        this.statistics,
    });

    PlayerPlayer? player;
    List<Statistic>? statistics;

    factory PlayerElement.fromJson(Map<String, dynamic> json) => PlayerElement(
        player: PlayerPlayer.fromJson(json["player"]),
        statistics: List<Statistic>.from(json["statistics"].map((x) => Statistic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "player": player!.toJson(),
        "statistics": List<dynamic>.from(statistics!.map((x) => x.toJson())),
    };
}

class PlayerPlayer {
    PlayerPlayer({
        this.id,
        this.name,
        this.photo,
    });

    int? id;
    String? name;
    String? photo;

    factory PlayerPlayer.fromJson(Map<String, dynamic> json) => PlayerPlayer(
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

class Statistic {
    Statistic({
        this.games,
        this.offsides,
        this.shots,
        this.goals,
        this.passes,
        this.tackles,
        this.duels,
        this.dribbles,
        this.fouls,
        this.cards,
        this.penalty,
    });

    Games? games;
    int? offsides;
    Shots? shots;
    Goals? goals;
    Passes? passes;
    Tackles? tackles;
    Duels? duels;
    Dribbles? dribbles;
    Fouls? fouls;
    Cards? cards;
    Penalty? penalty;

    factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        games: json["games"] == null ? null : Games.fromJson(json["games"]),
        offsides: json["offsides"] == null ? null : json["offsides"],
        shots: Shots.fromJson(json["shots"]),
        goals: Goals.fromJson(json["goals"]),
        passes: Passes.fromJson(json["passes"]),
        tackles: Tackles.fromJson(json["tackles"]),
        duels: Duels.fromJson(json["duels"]),
        dribbles: Dribbles.fromJson(json["dribbles"]),
        fouls: Fouls.fromJson(json["fouls"]),
        cards: Cards.fromJson(json["cards"]),
        penalty: Penalty.fromJson(json["penalty"]),
    );

    Map<String, dynamic> toJson() => {
        "games": games == null ? null : games!.toJson(),
        "offsides": offsides == null ? null : offsides,
        "shots": shots!.toJson(),
        "goals": goals!.toJson(),
        "passes": passes!.toJson(),
        "tackles": tackles!.toJson(),
        "duels": duels!.toJson(),
        "dribbles": dribbles!.toJson(),
        "fouls": fouls!.toJson(),
        "cards": cards!.toJson(),
        "penalty": penalty!.toJson(),
    };
}

class Cards {
    Cards({
        this.yellow,
        this.red,
    });

    int? yellow;
    int? red;

    factory Cards.fromJson(Map<String, dynamic> json) => Cards(
        yellow: json["yellow"],
        red: json["red"],
    );

    Map<String, dynamic> toJson() => {
        "yellow": yellow,
        "red": red,
    };
}

class Dribbles {
    Dribbles({
        this.attempts,
        this.success,
        this.past,
    });

    int? attempts;
    int? success;
    int? past;

    factory Dribbles.fromJson(Map<String, dynamic> json) => Dribbles(
        attempts: json["attempts"],
        success: json["success"],
        past: json["past"] == null ? null : json["past"],
    );

    Map<String, dynamic> toJson() => {
        "attempts": attempts,
        "success": success,
        "past": past == null ? null : past,
    };
}

class Duels {
    Duels({
        this.total,
        this.won,
    });

    int? total;
    int? won;

    factory Duels.fromJson(Map<String, dynamic> json) => Duels(
        total: json["total"],
        won: json["won"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "won": won,
    };
}

class Fouls {
    Fouls({
        this.drawn,
        this.committed,
    });

    int? drawn;
    int? committed;

    factory Fouls.fromJson(Map<String, dynamic> json) => Fouls(
        drawn: json["drawn"],
        committed: json["committed"],
    );

    Map<String, dynamic> toJson() => {
        "drawn": drawn,
        "committed": committed,
    };
}

class Games {
    Games({
        this.minutes,
        this.number,
        this.position,
        this.rating,
        this.captain,
        this.substitute,
    });

    int? minutes;
    int? number;
    String? position;
    String? rating;
    bool? captain;
    bool? substitute;

    factory Games.fromJson(Map<String, dynamic> json) => Games(
        minutes: json["minutes"],
        number: json["number"],
        position: json["position"],
        rating: json["rating"],
        captain: json["captain"],
        substitute: json["substitute"],
    );

    Map<String, dynamic> toJson() => {
        "minutes": minutes,
        "number": number,
        "position": position,
        "rating": rating,
        "captain": captain,
        "substitute": substitute,
    };
}

class Goals {
    Goals({
        this.total,
        this.conceded,
        this.assists,
        this.saves,
    });

    int? total;
    int? conceded;
    int? assists;
    int? saves;

    factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        total: json["total"] == null ? null : json["total"],
        conceded: json["conceded"],
        assists: json["assists"] == null ? null : json["assists"],
        saves: json["saves"] == null ? null : json["saves"],
    );

    Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "conceded": conceded,
        "assists": assists == null ? null : assists,
        "saves": saves == null ? null : saves,
    };
}

class Passes {
    Passes({
        this.total,
        this.key,
        this.accuracy,
    });

    int? total;
    int? key;
    String? accuracy;

    factory Passes.fromJson(Map<String, dynamic> json) => Passes(
        total: json["total"],
        key: json["key"],
        accuracy: json["accuracy"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "key": key,
        "accuracy": accuracy,
    };
}

class Penalty {
    Penalty({
        this.won,
        this.commited,
        this.scored,
        this.missed,
        this.saved,
    });

    int? won;
    int? commited;
    int? scored;
    int? missed;
    int? saved;

    factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
        won: json["won"] == null ? null : json["won"],
        commited: json["commited"] == null ? null : json["commited"],
        scored: json["scored"],
        missed: json["missed"],
        saved: json["saved"] == null ? null : json["saved"],
    );

    Map<String, dynamic> toJson() => {
        "won": won == null ? null : won,
        "commited": commited == null ? null : commited,
        "scored": scored,
        "missed": missed,
        "saved": saved == null ? null : saved,
    };
}

class Shots {
    Shots({
        this.total,
        this.on,
    });

    int? total;
    int? on;

    factory Shots.fromJson(Map<String, dynamic> json) => Shots(
        total: json["total"],
        on: json["on"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "on": on,
    };
}

class Tackles {
    Tackles({
        this.total,
        this.blocks,
        this.interceptions,
    });

    int? total;
    int? blocks;
    int? interceptions;

    factory Tackles.fromJson(Map<String, dynamic> json) => Tackles(
        total: json["total"] == null ? null : json["total"],
        blocks: json["blocks"],
        interceptions: json["interceptions"],
    );

    Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "blocks": blocks,
        "interceptions": interceptions,
    };
}

class Team {
    Team({
        this.id,
        this.name,
        this.logo,
        this.update,
    });

    int? id;
    String? name;
    String? logo;
    DateTime? update;

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        update: DateTime.parse(json["update"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "update": update!.toIso8601String(),
    };
}
