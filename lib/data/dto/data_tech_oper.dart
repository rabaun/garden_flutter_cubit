import 'dart:core';

import 'dart:core';

class TechOperDTO {
  List<TechOper>? techOper;

  TechOperDTO({
    required this.techOper,
  });

  factory TechOperDTO.fromJson(Map<String, dynamic> json) => TechOperDTO(
    techOper: json["techOper"] == null
        ? null
        : List<TechOper>.from(
        json["techOper"].map((x) => TechOper.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "techOper": techOper == null
        ? null
        : List<dynamic>.from(techOper!.map((x) => x.toJson())),
  };
}

class TechOper {
  String id;
  String name;
  String type;
  String wholeGarden;

  TechOper({
    required this.id,
    required this.name,
    required this.type,
    required this.wholeGarden,
  });

  factory TechOper.fromJson(Map<String, dynamic> map) => TechOper(
    id: map["id"],
    name: map["name"],
    type: map["type"],
    wholeGarden: map["wholeGarden"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "wholeGarden": wholeGarden,
  };
}
