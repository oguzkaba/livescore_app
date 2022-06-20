// To parse this JSON data, do
//
//     final leaguesModel = leaguesModelFromJson(jsonString);

import 'dart:convert';

LeaguesModel leaguesModelFromJson(String str) =>
    LeaguesModel.fromJson(json.decode(str));

String leaguesModelToJson(LeaguesModel data) => json.encode(data.toJson());

class LeaguesModel {
  LeaguesModel({
    this.leaguesModelGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  final String? leaguesModelGet;
  final List<dynamic>? parameters;
  final List<dynamic>? errors;
  final int? results;
  final Paging? paging;
  final List<Response>? response;

  factory LeaguesModel.fromJson(Map<String, dynamic> json) => LeaguesModel(
        leaguesModelGet: json["get"],
        parameters: List<dynamic>.from(json["parameters"].map((x) => x)),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": leaguesModelGet,
        "parameters": List<dynamic>.from(parameters!.map((x) => x)),
        "errors": List<dynamic>.from(errors!.map((x) => x)),
        "results": results,
        "paging": paging!.toJson(),
        "response": List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class Paging {
  Paging({
    this.current,
    this.total,
  });

  final int? current;
  final int? total;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        current: json["current"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "total": total,
      };
}

class Response {
  Response({
    this.league,
    this.country,
    this.seasons,
  });

  final League? league;
  final Country? country;
  final List<Season>? seasons;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        league: League.fromJson(json["league"]),
        country: Country.fromJson(json["country"]),
        seasons:
            List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
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

  final String? name;
  final String? code;
  final String? flag;

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

  final int? id;
  final String? name;
  final Type? type;
  final String? logo;

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        type: typeValues.map![json["type"]],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": typeValues.reverse[type],
        "logo": logo,
      };
}

enum Type { CUP, LEAGUE }

final typeValues = EnumValues({"Cup": Type.CUP, "League": Type.LEAGUE});

class Season {
  Season({
    this.year,
    this.start,
    this.end,
    this.current,
    this.coverage,
  });

  final int? year;
  final DateTime? start;
  final DateTime? end;
  final bool? current;
  final Coverage? coverage;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        year: json["year"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        current: json["current"],
        coverage: Coverage.fromJson(json["coverage"]),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "start":
            "${start!.year.toString().padLeft(4, '0')}-${start!.month.toString().padLeft(2, '0')}-${start!.day.toString().padLeft(2, '0')}",
        "end":
            "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
        "current": current,
        "coverage": coverage!.toJson(),
      };
}

class Coverage {
  Coverage({
    this.fixtures,
    this.standings,
    this.players,
    this.topScorers,
    this.topAssists,
    this.topCards,
    this.injuries,
    this.predictions,
    this.odds,
  });

  final Fixtures? fixtures;
  final bool? standings;
  final bool? players;
  final bool? topScorers;
  final bool? topAssists;
  final bool? topCards;
  final bool? injuries;
  final bool? predictions;
  final bool? odds;

  factory Coverage.fromJson(Map<String, dynamic> json) => Coverage(
        fixtures: Fixtures.fromJson(json["fixtures"]),
        standings: json["standings"],
        players: json["players"],
        topScorers: json["top_scorers"],
        topAssists: json["top_assists"],
        topCards: json["top_cards"],
        injuries: json["injuries"],
        predictions: json["predictions"],
        odds: json["odds"],
      );

  Map<String, dynamic> toJson() => {
        "fixtures": fixtures!.toJson(),
        "standings": standings,
        "players": players,
        "top_scorers": topScorers,
        "top_assists": topAssists,
        "top_cards": topCards,
        "injuries": injuries,
        "predictions": predictions,
        "odds": odds,
      };
}

class Fixtures {
  Fixtures({
    this.events,
    this.lineups,
    this.statisticsFixtures,
    this.statisticsPlayers,
  });

  final bool? events;
  final bool? lineups;
  final bool? statisticsFixtures;
  final bool? statisticsPlayers;

  factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
        events: json["events"],
        lineups: json["lineups"],
        statisticsFixtures: json["statistics_fixtures"],
        statisticsPlayers: json["statistics_players"],
      );

  Map<String, dynamic> toJson() => {
        "events": events,
        "lineups": lineups,
        "statistics_fixtures": statisticsFixtures,
        "statistics_players": statisticsPlayers,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
