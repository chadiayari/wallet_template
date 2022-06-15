class Transactions {
  String? id;
  String? projectId;
  int? numberOfShares;
  String? userId;
  String? transactionType;
  double? shareCost;
  double? total;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? beneficialId;

  Transactions(
      {this.id,
      this.projectId,
      this.numberOfShares,
      this.userId,
      this.transactionType,
      this.shareCost,
      this.total,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.beneficialId});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    projectId = json["projectId"];
    numberOfShares = json["numberOfShares"];
    userId = json["userId"];
    transactionType = json["transactionType"];
    shareCost = json["shareCost"];
    total = json["total"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    beneficialId = json["beneficialId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["projectId"] = projectId;
    data["numberOfShares"] = numberOfShares;
    data["userId"] = userId;
    data["transactionType"] = transactionType;
    data["shareCost"] = shareCost;
    data["total"] = total;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    data["beneficialId"] = beneficialId;
    return data;
  }
}
