import 'dart:convert';

class Pokemon {
  String? name;
  String? url;
  Sprites? sprites;
  List<Type>? types;
  bool isAdded;

  Pokemon({
    this.name,
    this.url,
    this.sprites,
    this.types,
    this.isAdded = false
  });

  factory Pokemon.fromRawJson(String str) => Pokemon.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
        sprites:
            json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
        types: json["types"] == null
            ? []
            : List<Type>.from(json["types"]!.map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "sprites": sprites?.toJson(),
        "types": types == null
            ? []
            : List<dynamic>.from(types!.map((x) => x.toJson())),
      };
}

class Sprites {
  String? backDefault;
  dynamic backFemale;
  String? backShiny;
  dynamic backShinyFemale;
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;
  Sprites? animated;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.animated,
  });

  factory Sprites.fromRawJson(String str) => Sprites.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        animated: json["animated"] == null
            ? null
            : Sprites.fromJson(json["animated"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "animated": animated?.toJson(),
      };
}

class Species {
  String? name;
  String? url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromRawJson(String str) => Species.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Type {
  int? slot;
  Species? type;

  Type({
    this.slot,
    this.type,
  });

  factory Type.fromRawJson(String str) => Type.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: json["type"] == null ? null : Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type?.toJson(),
      };
}
