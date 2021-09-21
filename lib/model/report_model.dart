// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ReportModel welcomeFromJson(String str) => ReportModel.fromJson(json.decode(str));

String welcomeToJson(ReportModel data) => json.encode(data.toJson());

class ReportModel {
  ReportModel({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
  });

  int id;
  String name;
  String email;
  Gender gender;
  Status status;

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    gender: genderValues.map[json["gender"]],
    status: statusValues.map[json["status"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "gender": genderValues.reverse[gender],
    "status": statusValues.reverse[status],
  };
}

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "male": Gender.MALE
});

enum Status { ACTIVE, INACTIVE }

final statusValues = EnumValues({
  "active": Status.ACTIVE,
  "inactive": Status.INACTIVE
});

class Meta {
  Meta({
    this.pagination,
  });

  Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  Pagination({
    this.total,
    this.pages,
    this.page,
    this.limit,
    this.links,
  });

  int total;
  int pages;
  int page;
  int limit;
  Links links;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    pages: json["pages"],
    page: json["page"],
    limit: json["limit"],
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "pages": pages,
    "page": page,
    "limit": limit,
    "links": links.toJson(),
  };
}

class Links {
  Links({
    this.previous,
    this.current,
    this.next,
  });

  dynamic previous;
  String current;
  String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    previous: json["previous"],
    current: json["current"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "previous": previous,
    "current": current,
    "next": next,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
