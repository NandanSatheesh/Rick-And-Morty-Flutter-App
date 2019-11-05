import 'dart:convert';

EpisodeResponse episodeResponseFromJson(String str) =>
    EpisodeResponse.fromJson(json.decode(str));

String episodeResponseToJson(EpisodeResponse data) =>
    json.encode(data.toJson());

class EpisodeResponse {
  Info info;
  List<Result> results;

  EpisodeResponse({
    this.info,
    this.results,
  });

  factory EpisodeResponse.fromJson(Map<String, dynamic> json) =>
      EpisodeResponse(
        info: Info.fromJson(json["info"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  int count;
  int pages;
  String next;
  String prev;

  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}

class Result {
  int id;
  String name;
  String airDate;
  String episode;
  List<String> characters;
  String url;
  DateTime created;

  Result({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
