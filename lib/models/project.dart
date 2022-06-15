class Project {
  String? id;
  List<ShareValueHistory>? shareValueHistory;
  String? title;
  String? organization;
  double? shareValue;
  String? logoUrl;
  String? description;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? v;

  Project(
      {this.id,
      this.shareValueHistory,
      this.title,
      this.organization,
      this.shareValue,
      this.logoUrl,
      this.description,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.v});

  Project.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    shareValueHistory = json["shareValueHistory"] == null
        ? null
        : (json["shareValueHistory"] as List)
            .map((e) => ShareValueHistory.fromJson(e))
            .toList();
    title = json["title"];
    organization = json["organization"];
    shareValue = json["shareValue"];
    logoUrl = json["logoUrl"];
    description = json["description"];
    createdBy = json["createdBy"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    if (shareValueHistory != null) {
      data["shareValueHistory"] =
          shareValueHistory?.map((e) => e.toJson()).toList();
    }
    data["title"] = title;
    data["organization"] = organization;
    data["shareValue"] = shareValue;
    data["logoUrl"] = logoUrl;
    data["description"] = description;
    data["createdBy"] = createdBy;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    return data;
  }
}

class ShareValueHistory {
  String? year;
  double? value;

  ShareValueHistory({this.year, this.value});

  ShareValueHistory.fromJson(Map<String, dynamic> json) {
    year = json["year"];
    value = json["value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["year"] = year;
    data["value"] = value;
    return data;
  }
}
