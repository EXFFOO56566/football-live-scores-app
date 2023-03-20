// To parse this JSON data, do
//
//     final singlefixture = singlefixtureFromJson(jsonString);

import 'dart:convert';

List<Singlefixture> singlefixtureFromJson(String str) => List<Singlefixture>.from(json.decode(str).map((x) => Singlefixture.fromJson(x)));

String singlefixtureToJson(List<Singlefixture> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Singlefixture {
    Singlefixture({
        this.fixture,
        this.league,
        this.teams,
        this.goals,
        this.score,
        this.events,
        this.lineups,
        this.statistics,
        this.players,
    });

    Fixture? fixture;
    League? league;
    TeamsClass? teams;
    TeamsClass? goals;
    Score? score;
    List<Event> ?events;
    List<Lineups>? lineups;
    List<SinglefixtureStatistic>? statistics;
    List<SinglefixturePlayer>? players;

    factory Singlefixture.fromJson(Map<String, dynamic> json) => Singlefixture(
        fixture: Fixture.fromJson(json["fixture"]),
        league: League.fromJson(json["league"]),
        teams: TeamsClass.fromJson(json["teams"]),
        goals: TeamsClass.fromJson(json["goals"]),
        score: Score.fromJson(json["score"]),
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
        lineups: List<Lineups>.from(json["lineups"].map((x) => Lineups.fromJson(x))),
        statistics: List<SinglefixtureStatistic>.from(json["statistics"].map((x) => SinglefixtureStatistic.fromJson(x))),
        players: List<SinglefixturePlayer>.from(json["players"].map((x) => SinglefixturePlayer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "fixture": fixture!.toJson(),
        "league": league!.toJson(),
        "teams": teams!.toJson(),
        "goals": goals!.toJson(),
        "score": score!.toJson(),
        "events": List<dynamic>.from(events!.map((x) => x.toJson())),
        "lineups": List<dynamic>.from(lineups!.map((x) => x.toJson())),
        "statistics": List<dynamic>.from(statistics!.map((x) => x.toJson())),
        "players": List<dynamic>.from(players!.map((x) => x.toJson())),
    };
}

class Event {
    Event({
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
    Type? type;
    String? detail;
    dynamic comments;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        time: Time.fromJson(json["time"]),
        team: Team.fromJson(json["team"]),
        player: Assist.fromJson(json["player"]),
        assist: Assist.fromJson(json["assist"]),
        type: typeValues.map![json["type"]],
        detail: json["detail"],
        comments: json["comments"],
    );

    Map<String, dynamic> toJson() => {
        "time": time!.toJson(),
        "team": team!.toJson(),
        "player": player!.toJson(),
        "assist": assist!.toJson(),
        "type": typeValues.reverse[type],
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
        this.colors,
        this.update,
        this.winner,
    });

    int? id;
    Name? name;
    String? logo;
    dynamic colors;
    DateTime?update;
    bool? winner;

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: nameValues.map![json["name"]],
        logo: json["logo"],
        colors: json["colors"],
        update: json["update"] == null ? null : DateTime.parse(json["update"]),
        winner: json["winner"] == null ? null : json["winner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "logo": logo,
        "colors": colors,
        "update": update == null ? null : update!.toIso8601String(),
        "winner": winner == null ? null : winner,
    };
}

enum Name { ALDOSIVI, DEFENSA_Y_JUSTICIA }

final nameValues = EnumValues({
    "Aldosivi": Name.ALDOSIVI,
    "Defensa Y Justicia": Name.DEFENSA_Y_JUSTICIA
});

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

enum Type { GOAL, CARD, SUBST }

final typeValues = EnumValues({
    "Card": Type.CARD,
    "Goal": Type.GOAL,
    "subst": Type.SUBST
});

class Fixture {
    Fixture({
        this.id,
        this.referee,
        this.timezone,
        this.date,
        this.timestamp,
        this.periods,
        this.venue,
        this.status,
    });

    int? id;
    String? referee;
    String? timezone;
    DateTime? date;
    int? timestamp;
    Periods? periods;
    Venue? venue;
    Status? status;

    factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json["id"],
        referee: json["referee"],
        timezone: json["timezone"],
        date: DateTime.parse(json["date"]),
        timestamp: json["timestamp"],
        periods: Periods.fromJson(json["periods"]),
        venue: Venue.fromJson(json["venue"]),
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "referee": referee,
        "timezone": timezone,
        "date": date!.toIso8601String(),
        "timestamp": timestamp,
        "periods": periods!.toJson(),
        "venue": venue!.toJson(),
        "status": status!.toJson(),
    };
}

class Periods {
    Periods({
        this.first,
        this.second,
    });

    int? first;
    int?second;

    factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        first: json["first"],
        second: json["second"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "second": second,
    };
}

class Status {
    Status({
        this.long,
        this.short,
        this.elapsed,
    });

    String? long;
    String? short;
    int? elapsed;

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        long: json["long"],
        short: json["short"],
        elapsed: json["elapsed"],
    );

    Map<String, dynamic> toJson() => {
        "long": long,
        "short": short,
        "elapsed": elapsed,
    };
}

class Venue {
    Venue({
        this.id,
        this.name,
        this.city,
    });

    int? id;
    String? name;
    String? city;

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
    };
}

class TeamsClass {
    TeamsClass({
        this.home,
        this.away,
    });

    dynamic home;
    dynamic away;

    factory TeamsClass.fromJson(Map<String, dynamic> json) => TeamsClass(
        home: json["home"],
        away: json["away"],
    );

    Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
    };
}

class League {
    League({
        this.id,
        this.name,
        this.country,
        this.logo,
        this.flag,
        this.season,
        this.round,
    });

    int? id;
    String? name;
    String? country;
    String? logo;
    String? flag;
    int? season;
    String? round;

    factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
        round: json["round"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
        "round": round,
    };
}

class Lineups {
    Lineups({
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

    factory Lineups.fromJson(Map<String, dynamic> json) => Lineups(
        team: Team.fromJson(json["team"]),
        coach: Coach.fromJson(json["coach"]),
        formation: json["formation"],
        startXi: List<StartXi>.from(json["startXI"].map((x) => StartXi.fromJson(x))),
        substitutes: List<StartXi>.from(json["substitutes"].map((x) => StartXi.fromJson(x))),
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

    int ?id;
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

    StartXiPlayer? player;

    factory StartXi.fromJson(Map<String, dynamic> json) => StartXi(
        player: StartXiPlayer.fromJson(json["player"]),
    );

    Map<String, dynamic> toJson() => {
        "player": player!.toJson(),
    };
}

class StartXiPlayer {
    StartXiPlayer({
        this.id,
        this.name,
        this.number,
        this.pos,
        this.grid,
    });

    int ?id;
    String ?name;
    int? number;
    Pos? pos;
    String? grid;

    factory StartXiPlayer.fromJson(Map<String, dynamic> json) => StartXiPlayer(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        pos: json["pos"] == null ? null : posValues.map![json["pos"]],
        grid: json["grid"] == null ? null : json["grid"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number": number,
        "pos": pos == null ? null : posValues.reverse[pos],
        "grid": grid == null ? null : grid,
    };
}

enum Pos { G, D, M, F }

final posValues = EnumValues({
    "D": Pos.D,
    "F": Pos.F,
    "G": Pos.G,
    "M": Pos.M
});

class SinglefixturePlayer {
    SinglefixturePlayer({
        this.team,
        this.players,
    });

    Team? team;
    List<PlayerPlayer>? players;

    factory SinglefixturePlayer.fromJson(Map<String, dynamic> json) => SinglefixturePlayer(
        team: Team.fromJson(json["team"]),
        players: List<PlayerPlayer>.from(json["players"].map((x) => PlayerPlayer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "team": team!.toJson(),
        "players": List<dynamic>.from(players!.map((x) => x.toJson())),
    };
}

class PlayerPlayer {
    PlayerPlayer({
        this.player,
        this.statistics,
    });

    Coach? player;
    List<PlayerStatistic>? statistics;

    factory PlayerPlayer.fromJson(Map<String, dynamic> json) => PlayerPlayer(
        player: Coach.fromJson(json["player"]),
        statistics: List<PlayerStatistic>.from(json["statistics"].map((x) => PlayerStatistic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "player": player!.toJson(),
        "statistics": List<dynamic>.from(statistics!.map((x) => x.toJson())),
    };
}

class PlayerStatistic {
    PlayerStatistic({
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
    dynamic offsides;
    Shots? shots;
    StatisticGoals? goals;
    Passes? passes;
    Tackles? tackles;
    Duels? duels;
    Dribbles? dribbles;
    Fouls ?fouls;
    Cards? cards;
    Penalty? penalty;

    factory PlayerStatistic.fromJson(Map<String, dynamic> json) => PlayerStatistic(
        games: Games.fromJson(json["games"]),
        offsides: json["offsides"],
        shots: Shots.fromJson(json["shots"]),
        goals: StatisticGoals.fromJson(json["goals"]),
        passes: Passes.fromJson(json["passes"]),
        tackles: Tackles.fromJson(json["tackles"]),
        duels: Duels.fromJson(json["duels"]),
        dribbles: Dribbles.fromJson(json["dribbles"]),
        fouls: Fouls.fromJson(json["fouls"]),
        cards: Cards.fromJson(json["cards"]),
        penalty: Penalty.fromJson(json["penalty"]),
    );

    Map<String, dynamic> toJson() => {
        "games": games!.toJson(),
        "offsides": offsides,
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

    dynamic total;
    dynamic won;

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
    Pos? position;
    String?rating;
    bool? captain;
    bool? substitute;

    factory Games.fromJson(Map<String, dynamic> json) => Games(
        minutes: json["minutes"],
        number: json["number"],
        position: posValues.map![json["position"]],
        rating: json["rating"],
        captain: json["captain"],
        substitute: json["substitute"],
    );

    Map<String, dynamic> toJson() => {
        "minutes": minutes,
        "number": number,
        "position": posValues.reverse[position],
        "rating": rating,
        "captain": captain,
        "substitute": substitute,
    };
}

class StatisticGoals {
    StatisticGoals({
        this.total,
        this.conceded,
        this.assists,
        this.saves,
    });

    int? total;
    int? conceded;
    dynamic assists;
    int? saves;

    factory StatisticGoals.fromJson(Map<String, dynamic> json) => StatisticGoals(
        total: json["total"] == null ? null : json["total"],
        conceded: json["conceded"],
        assists: json["assists"],
        saves: json["saves"] == null ? null : json["saves"],
    );

    Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "conceded": conceded,
        "assists": assists,
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

    dynamic won;
    dynamic commited;
    int? scored;
    int? missed;
    int? saved;

    factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
        won: json["won"],
        commited: json["commited"],
        scored: json["scored"],
        missed: json["missed"],
        saved: json["saved"] == null ? null : json["saved"],
    );

    Map<String, dynamic> toJson() => {
        "won": won,
        "commited": commited,
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

class Score {
    Score({
        this.halftime,
        this.fulltime,
        this.extratime,
        this.penalty,
    });

    TeamsClass? halftime;
    TeamsClass? fulltime;
    TeamsClass ?extratime;
    TeamsClass ?penalty;

    factory Score.fromJson(Map<String, dynamic> json) => Score(
        halftime: TeamsClass.fromJson(json["halftime"]),
        fulltime: TeamsClass.fromJson(json["fulltime"]),
        extratime: TeamsClass.fromJson(json["extratime"]),
        penalty: TeamsClass.fromJson(json["penalty"]),
    );

    Map<String, dynamic> toJson() => {
        "halftime": halftime!.toJson(),
        "fulltime": fulltime!.toJson(),
        "extratime": extratime!.toJson(),
        "penalty": penalty!.toJson(),
    };
}

class SinglefixtureStatistic {
    SinglefixtureStatistic({
        this.team,
        this.statistics,
    });

    Team? team;
    List<StatisticStatistic>? statistics;

    factory SinglefixtureStatistic.fromJson(Map<String, dynamic> json) => SinglefixtureStatistic(
        team: Team.fromJson(json["team"]),
        statistics: List<StatisticStatistic>.from(json["statistics"].map((x) => StatisticStatistic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "team": team!.toJson(),
        "statistics": List<dynamic>.from(statistics!.map((x) => x.toJson())),
    };
}

class StatisticStatistic {
    StatisticStatistic({
        this.type,
        this.value,
    });

    String? type;
    dynamic value;

    factory StatisticStatistic.fromJson(Map<String, dynamic> json) => StatisticStatistic(
        type: json["type"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
    };
}

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
