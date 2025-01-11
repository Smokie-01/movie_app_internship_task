class MovieModel {
  MovieModel({
    required this.score,
    required this.show,
  });

  final double? score;
  final Show? show;

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      score: json["score"],
      show: json["show"] == null ? null : Show.fromJson(json["show"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "score": score,
        "show": show?.toJson(),
      };
}

class Show {
  Show({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.schedule,
    required this.rating,
    required this.weight,
    required this.network,
    required this.webChannel,
    required this.dvdCountry,
    required this.externals,
    required this.image,
    required this.summary,
    required this.updated,
    required this.links,
  });

  final int? id;
  final String? url;
  final String? name;
  final String? type;
  final String? language;
  final List<String> genres;
  final String? status;
  final int? runtime;
  final int? averageRuntime;
  final DateTime? premiered;
  final DateTime? ended;
  final String? officialSite;
  final Schedule? schedule;
  final Rating? rating;
  final int? weight;
  final Network? network;
  final dynamic webChannel;
  final dynamic dvdCountry;
  final Externals? externals;
  final Image? image;
  final String? summary;
  final int? updated;
  final Links? links;

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json["id"],
      url: json["url"],
      name: json["name"],
      type: json["type"],
      language: json["language"],
      genres: json["genres"] == null
          ? []
          : List<String>.from(json["genres"]!.map((x) => x)),
      status: json["status"],
      runtime: json["runtime"],
      averageRuntime: json["averageRuntime"],
      premiered: DateTime.tryParse(json["premiered"] ?? ""),
      ended: DateTime.tryParse(json["ended"] ?? ""),
      officialSite: json["officialSite"],
      schedule:
          json["schedule"] == null ? null : Schedule.fromJson(json["schedule"]),
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      weight: json["weight"],
      network:
          json["network"] == null ? null : Network.fromJson(json["network"]),
      webChannel: json["webChannel"],
      dvdCountry: json["dvdCountry"],
      externals: json["externals"] == null
          ? null
          : Externals.fromJson(json["externals"]),
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      summary: json["summary"],
      updated: json["updated"],
      links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": genres.map((x) => x).toList(),
        "status": status,
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "premiered":
            "${premiered!.year.toString().padLeft(4, '0')}-${premiered!.month.toString().padLeft(2, '0')}-${premiered!.day.toString().padLeft(2, '0')}",
        "ended":
            "${ended!.year.toString().padLeft(4, '0')}-${ended!.month.toString().padLeft(2, '0')}-${ended!.day.toString().padLeft(2, '0')}",
        "officialSite": officialSite,
        "schedule": schedule?.toJson(),
        "rating": rating?.toJson(),
        "weight": weight,
        "network": network?.toJson(),
        "webChannel": webChannel,
        "dvdCountry": dvdCountry,
        "externals": externals?.toJson(),
        "image": image?.toJson(),
        "summary": summary,
        "updated": updated,
        "_links": links?.toJson(),
      };
}

class Externals {
  Externals({
    required this.tvrage,
    required this.thetvdb,
    required this.imdb,
  });

  final dynamic tvrage;
  final int? thetvdb;
  final String? imdb;

  factory Externals.fromJson(Map<String, dynamic> json) {
    return Externals(
      tvrage: json["tvrage"],
      thetvdb: json["thetvdb"],
      imdb: json["imdb"],
    );
  }

  Map<String, dynamic> toJson() => {
        "tvrage": tvrage,
        "thetvdb": thetvdb,
        "imdb": imdb,
      };
}

class Image {
  Image({
    required this.medium,
    required this.original,
  });

  final String? medium;
  final String? original;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      medium: json["medium"],
      original: json["original"],
    );
  }

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}

class Links {
  Links({
    required this.self,
    required this.previousepisode,
  });

  final Self? self;
  final Previousepisode? previousepisode;

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json["self"] == null ? null : Self.fromJson(json["self"]),
      previousepisode: json["previousepisode"] == null
          ? null
          : Previousepisode.fromJson(json["previousepisode"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
        "previousepisode": previousepisode?.toJson(),
      };
}

class Previousepisode {
  Previousepisode({
    required this.href,
    required this.name,
  });

  final String? href;
  final String? name;

  factory Previousepisode.fromJson(Map<String, dynamic> json) {
    return Previousepisode(
      href: json["href"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "href": href,
        "name": name,
      };
}

class Self {
  Self({
    required this.href,
  });

  final String? href;

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(
      href: json["href"],
    );
  }

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Network {
  Network({
    required this.id,
    required this.name,
    required this.country,
    required this.officialSite,
  });

  final int? id;
  final String? name;
  final Country? country;
  final dynamic officialSite;

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json["id"],
      name: json["name"],
      country:
          json["country"] == null ? null : Country.fromJson(json["country"]),
      officialSite: json["officialSite"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country?.toJson(),
        "officialSite": officialSite,
      };
}

class Country {
  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  final String? name;
  final String? code;
  final String? timezone;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["name"],
      code: json["code"],
      timezone: json["timezone"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "timezone": timezone,
      };
}

class Rating {
  Rating({
    required this.average,
  });

  final double? average;

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average:
          json["average"] is int ? json["average"].toDouble() : json["average"],
    );
  }

  Map<String, dynamic> toJson() => {
        "average": average,
      };
}

class Schedule {
  Schedule({
    required this.time,
    required this.days,
  });

  final String? time;
  final List<String> days;

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json["time"],
      days: json["days"] == null
          ? []
          : List<String>.from(json["days"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "time": time,
        "days": days.map((x) => x).toList(),
      };
}
