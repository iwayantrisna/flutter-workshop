// To parse this JSON data, do
//
//     final detailTeam = detailTeamFromJson(jsonString);

import 'dart:convert';

DetailTeam detailTeamFromJson(String str) =>
    DetailTeam.fromJson(json.decode(str));

String detailTeamToJson(DetailTeam data) => json.encode(data.toJson());

class DetailTeam {
  Data data;
  List<Subscription> subscription;
  RateLimit rateLimit;
  String timezone;

  DetailTeam({
    required this.data,
    required this.subscription,
    required this.rateLimit,
    required this.timezone,
  });

  factory DetailTeam.fromJson(Map<String, dynamic> json) => DetailTeam(
        data: Data.fromJson(json["data"]),
        subscription: List<Subscription>.from(
            json["subscription"].map((x) => Subscription.fromJson(x))),
        rateLimit: RateLimit.fromJson(json["rate_limit"]),
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "subscription": List<dynamic>.from(subscription.map((x) => x.toJson())),
        "rate_limit": rateLimit.toJson(),
        "timezone": timezone,
      };
}

class Data {
  int id;
  int sportId;
  int countryId;
  int venueId;
  String gender;
  String name;
  String shortCode;
  String imagePath;
  int founded;
  String type;
  bool placeholder;
  DateTime lastPlayedAt;
  Country country;
  Venue venue;

  Data({
    required this.id,
    required this.sportId,
    required this.countryId,
    required this.venueId,
    required this.gender,
    required this.name,
    required this.shortCode,
    required this.imagePath,
    required this.founded,
    required this.type,
    required this.placeholder,
    required this.lastPlayedAt,
    required this.country,
    required this.venue,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        sportId: json["sport_id"],
        countryId: json["country_id"],
        venueId: json["venue_id"],
        gender: json["gender"],
        name: json["name"],
        shortCode: json["short_code"],
        imagePath: json["image_path"],
        founded: json["founded"],
        type: json["type"],
        placeholder: json["placeholder"],
        lastPlayedAt: DateTime.parse(json["last_played_at"]),
        country: Country.fromJson(json["country"]),
        venue: Venue.fromJson(json["venue"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sport_id": sportId,
        "country_id": countryId,
        "venue_id": venueId,
        "gender": gender,
        "name": name,
        "short_code": shortCode,
        "image_path": imagePath,
        "founded": founded,
        "type": type,
        "placeholder": placeholder,
        "last_played_at": lastPlayedAt.toIso8601String(),
        "country": country.toJson(),
        "venue": venue.toJson(),
      };
}

class Country {
  int id;
  int continentId;
  String name;
  String officialName;
  String fifaName;
  String iso2;
  String iso3;
  String latitude;
  String longitude;
  List<String> borders;
  String imagePath;

  Country({
    required this.id,
    required this.continentId,
    required this.name,
    required this.officialName,
    required this.fifaName,
    required this.iso2,
    required this.iso3,
    required this.latitude,
    required this.longitude,
    required this.borders,
    required this.imagePath,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        continentId: json["continent_id"],
        name: json["name"],
        officialName: json["official_name"],
        fifaName: json["fifa_name"],
        iso2: json["iso2"],
        iso3: json["iso3"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        borders: List<String>.from(json["borders"].map((x) => x)),
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "continent_id": continentId,
        "name": name,
        "official_name": officialName,
        "fifa_name": fifaName,
        "iso2": iso2,
        "iso3": iso3,
        "latitude": latitude,
        "longitude": longitude,
        "borders": List<dynamic>.from(borders.map((x) => x)),
        "image_path": imagePath,
      };
}

class Venue {
  int id;
  dynamic countryId;
  dynamic cityId;
  String name;
  String address;
  dynamic zipcode;
  String latitude;
  String longitude;
  int capacity;
  String imagePath;
  String cityName;
  String surface;
  bool nationalTeam;

  Venue({
    required this.id,
    required this.countryId,
    required this.cityId,
    required this.name,
    required this.address,
    required this.zipcode,
    required this.latitude,
    required this.longitude,
    required this.capacity,
    required this.imagePath,
    required this.cityName,
    required this.surface,
    required this.nationalTeam,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        countryId: json["country_id"],
        cityId: json["city_id"],
        name: json["name"],
        address: json["address"],
        zipcode: json["zipcode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        capacity: json["capacity"],
        imagePath: json["image_path"],
        cityName: json["city_name"],
        surface: json["surface"],
        nationalTeam: json["national_team"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country_id": countryId,
        "city_id": cityId,
        "name": name,
        "address": address,
        "zipcode": zipcode,
        "latitude": latitude,
        "longitude": longitude,
        "capacity": capacity,
        "image_path": imagePath,
        "city_name": cityName,
        "surface": surface,
        "national_team": nationalTeam,
      };
}

class RateLimit {
  int resetsInSeconds;
  int remaining;
  String requestedEntity;

  RateLimit({
    required this.resetsInSeconds,
    required this.remaining,
    required this.requestedEntity,
  });

  factory RateLimit.fromJson(Map<String, dynamic> json) => RateLimit(
        resetsInSeconds: json["resets_in_seconds"],
        remaining: json["remaining"],
        requestedEntity: json["requested_entity"],
      );

  Map<String, dynamic> toJson() => {
        "resets_in_seconds": resetsInSeconds,
        "remaining": remaining,
        "requested_entity": requestedEntity,
      };
}

class Subscription {
  List<dynamic> meta;
  List<Plan> plans;
  List<dynamic> addOns;
  List<dynamic> widgets;

  Subscription({
    required this.meta,
    required this.plans,
    required this.addOns,
    required this.widgets,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
        addOns: List<dynamic>.from(json["add_ons"].map((x) => x)),
        widgets: List<dynamic>.from(json["widgets"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
        "add_ons": List<dynamic>.from(addOns.map((x) => x)),
        "widgets": List<dynamic>.from(widgets.map((x) => x)),
      };
}

class Plan {
  String plan;
  String sport;
  String category;

  Plan({
    required this.plan,
    required this.sport,
    required this.category,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        plan: json["plan"],
        sport: json["sport"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "plan": plan,
        "sport": sport,
        "category": category,
      };
}