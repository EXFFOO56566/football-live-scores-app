// To parse this JSON data, do
//
//     final leaguefixture = leaguefixtureFromJson(jsonString);

import 'dart:convert';

List<Leaguefixture> leaguefixtureFromJson(String str) => List<Leaguefixture>.from(json.decode(str).map((x) => Leaguefixture.fromJson(x)));

String leaguefixtureToJson(List<Leaguefixture> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Leaguefixture {
    Leaguefixture({
        this.fixture,
        this.league,
        this.teams,
        this.goals,
        this.score,
    });

    Fixture? fixture;
    League? league;
    Goals? teams;
    Goals? goals;
    Score? score;

    factory Leaguefixture.fromJson(Map<String, dynamic> json) => Leaguefixture(
        fixture: Fixture.fromJson(json["fixture"]),
        league: League.fromJson(json["league"]),
        teams: Goals.fromJson(json["teams"]),
        goals: Goals.fromJson(json["goals"]),
        score: Score.fromJson(json["score"]),
    );

    Map<String, dynamic> toJson() => {
        "fixture": fixture!.toJson(),
        "league": league!.toJson(),
        "teams": teams!.toJson(),
        "goals": goals!.toJson(),
        "score": score!.toJson(),
    };
}

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
    int? second;

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

class Goals {
    Goals({
        this.home,
        this.away,
    });

    dynamic home;
    dynamic away;

    factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        home: json["home"],
        away: json["away"],
    );

    Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
    };
}

class AwayClass {
    AwayClass({
        this.id,
        this.name,
        this.logo,
        this.winner,
    });

    int? id;
    String? name;
    String? logo;
    bool? winner;

    factory AwayClass.fromJson(Map<String, dynamic> json) => AwayClass(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        winner: json["winner"] == null ? null : json["winner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "winner": winner == null ? null : winner,
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

class Score {
    Score({
        this.halftime,
        this.fulltime,
        this.extratime,
        this.penalty,
    });

    Goals? halftime;
    Goals? fulltime;
    Goals? extratime;
    Goals? penalty;

    factory Score.fromJson(Map<String, dynamic> json) => Score(
        halftime: Goals.fromJson(json["halftime"]),
        fulltime: Goals.fromJson(json["fulltime"]),
        extratime: Goals.fromJson(json["extratime"]),
        penalty: Goals.fromJson(json["penalty"]),
    );

    Map<String, dynamic> toJson() => {
        "halftime": halftime!.toJson(),
        "fulltime": fulltime!.toJson(),
        "extratime": extratime!.toJson(),
        "penalty": penalty!.toJson(),
    };
}
