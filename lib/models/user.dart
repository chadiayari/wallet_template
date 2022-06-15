class User {
  List<Logs>? logs;
  String? id;
  String? onesignalId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? emiratesId;
  Emirates? emirates;
  String? gender;
  String? address;
  String? email;
  String? password;
  int? phoneNumber;
  String? preferredEmail;
  int? preferredPhoneNumber;
  bool? isAdmin;
  int? numberOfPurchasedShares;
  int? numberOfTransferedShares;
  int? numberOfRecievedShares;
  PortfolioId? portfolioId;
  String? createdAt;
  String? updatedAt;
  int? v;

  User(
      {this.logs,
      this.id,
      this.onesignalId,
      this.firstName,
      this.middleName,
      this.lastName,
      this.emiratesId,
      this.emirates,
      this.gender,
      this.address,
      this.email,
      this.password,
      this.phoneNumber,
      this.preferredEmail,
      this.preferredPhoneNumber,
      this.isAdmin,
      this.numberOfPurchasedShares,
      this.numberOfTransferedShares,
      this.numberOfRecievedShares,
      this.portfolioId,
      this.createdAt,
      this.updatedAt,
      this.v});

  User.fromJson(Map<String, dynamic> json) {
    logs = json["logs"] == null
        ? null
        : (json["logs"] as List).map((e) => Logs.fromJson(e)).toList();
    id = json["_id"];
    onesignalId = json["onesignalId"];
    firstName = json["firstName"];
    middleName = json["middleName"];
    lastName = json["lastName"];
    emiratesId = json["emiratesId"];
    emirates =
        json["emirates"] == null ? null : Emirates.fromJson(json["emirates"]);
    gender = json["gender"];
    address = json["address"];
    email = json["email"];
    password = json["password"];
    phoneNumber = json["phoneNumber"];
    preferredEmail = json["preferredEmail"];
    preferredPhoneNumber = json["preferredPhoneNumber"];
    isAdmin = json["isAdmin"];
    numberOfPurchasedShares = json["numberOfPurchasedShares"];
    numberOfTransferedShares = json["numberOfTransferedShares"];
    numberOfRecievedShares = json["numberOfRecievedShares"];
    portfolioId = json["portfolioId"] == null
        ? null
        : PortfolioId.fromJson(json["portfolioId"]);
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (logs != null) data["logs"] = logs?.map((e) => e.toJson()).toList();
    data["_id"] = id;
    data["onesignalId"] = onesignalId;
    data["firstName"] = firstName;
    data["middleName"] = middleName;
    data["lastName"] = lastName;
    data["emiratesId"] = emiratesId;
    if (emirates != null) data["emirates"] = emirates?.toJson();
    data["gender"] = gender;
    data["address"] = address;
    data["email"] = email;
    data["password"] = password;
    data["phoneNumber"] = phoneNumber;
    data["preferredEmail"] = preferredEmail;
    data["preferredPhoneNumber"] = preferredPhoneNumber;
    data["isAdmin"] = isAdmin;
    data["numberOfPurchasedShares"] = numberOfPurchasedShares;
    data["numberOfTransferedShares"] = numberOfTransferedShares;
    data["numberOfRecievedShares"] = numberOfRecievedShares;
    if (portfolioId != null) data["portfolioId"] = portfolioId?.toJson();
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    return data;
  }
}

class PortfolioId {
  List<OwnedShares>? ownedShares;
  String? id;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? v;

  PortfolioId(
      {this.ownedShares,
      this.id,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.v});

  PortfolioId.fromJson(Map<String, dynamic> json) {
    ownedShares = json["ownedShares"] == null
        ? null
        : (json["ownedShares"] as List)
            .map((e) => OwnedShares.fromJson(e))
            .toList();
    id = json["_id"];
    userId = json["userId"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ownedShares != null) {
      data["ownedShares"] = ownedShares?.map((e) => e.toJson()).toList();
    }
    data["_id"] = id;
    data["userId"] = userId;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    return data;
  }
}

class OwnedShares {
  String? id;
  String? title;
  var shareValue;
  var numberOfOwnedShares;
  var totalSharesValue;
  var returnOnInvestment;
  List<PurchaseHistory>? purchaseHistory;

  OwnedShares(
      {this.id,
      this.title,
      this.shareValue,
      this.numberOfOwnedShares,
      this.totalSharesValue,
      this.returnOnInvestment,
      this.purchaseHistory});

  OwnedShares.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    title = json["title"];
    shareValue = json["shareValue"];
    numberOfOwnedShares = json["numberOfOwnedShares"];
    totalSharesValue = json["totalSharesValue"];
    returnOnInvestment = json["returnOnInvestment"];
    purchaseHistory = json["purchaseHistory"] == null
        ? null
        : (json["purchaseHistory"] as List)
            .map((e) => PurchaseHistory.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["title"] = title;
    data["shareValue"] = shareValue;
    data["numberOfOwnedShares"] = numberOfOwnedShares;
    data["totalSharesValue"] = totalSharesValue;
    data["returnOnInvestment"] = returnOnInvestment;
    if (purchaseHistory != null) {
      data["purchaseHistory"] =
          purchaseHistory?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class PurchaseHistory {
  String? date;
  var purchaseValue;
  var numberOfShares;
  var totalPurchasePrice;

  PurchaseHistory(
      {this.date,
      this.purchaseValue,
      this.numberOfShares,
      this.totalPurchasePrice});

  PurchaseHistory.fromJson(Map<String, dynamic> json) {
    date = json["date"];
    purchaseValue = json["purchaseValue"];
    numberOfShares = json["numberOfShares"];
    totalPurchasePrice = json["totalPurchasePrice"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["date"] = date;
    data["purchaseValue"] = purchaseValue;
    data["numberOfShares"] = numberOfShares;
    data["totalPurchasePrice"] = totalPurchasePrice;
    return data;
  }
}

class Emirates {
  String? emiratedIdFront;
  String? emiratesIdBack;
  String? expieryDate;

  Emirates({this.emiratedIdFront, this.emiratesIdBack, this.expieryDate});

  Emirates.fromJson(Map<String, dynamic> json) {
    emiratedIdFront = json["emiratedIdFront"];
    emiratesIdBack = json["emiratesIdBack"];
    expieryDate = json["expieryDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["emiratedIdFront"] = emiratedIdFront;
    data["emiratesIdBack"] = emiratesIdBack;
    data["expieryDate"] = expieryDate;
    return data;
  }
}

class Logs {
  String? id;
  String? message;
  String? tag;

  Logs({this.id, this.message, this.tag});

  Logs.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    message = json["message"];
    tag = json["tag"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["message"] = message;
    data["tag"] = tag;
    return data;
  }
}
