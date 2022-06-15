// class Portfolio {
//   List<OwnedShares>? ownedShares;
//   String? id;
//   String? userId;
//   String? createdAt;
//   String? updatedAt;
//   int? v;

//   Portfolio(
//       {this.ownedShares,
//       this.id,
//       this.userId,
//       this.createdAt,
//       this.updatedAt,
//       this.v});

//   Portfolio.fromJson(Map<String, dynamic> json) {
//     ownedShares = json["ownedShares"] == null
//         ? null
//         : (json["ownedShares"] as List)
//             .map((e) => OwnedShares.fromJson(e))
//             .toList();
//     id = json["_id"];
//     userId = json["userId"];
//     createdAt = json["createdAt"];
//     updatedAt = json["updatedAt"];
//     v = json["__v"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (ownedShares != null) {
//       data["ownedShares"] = ownedShares?.map((e) => e.toJson()).toList();
//     }
//     data["_id"] = id;
//     data["userId"] = userId;
//     data["createdAt"] = createdAt;
//     data["updatedAt"] = updatedAt;
//     data["__v"] = v;
//     return data;
//   }
// }

// class OwnedShares {
//   String? id;
//   String? title;
//   double? shareValue;
//   var numberOfOwnedShares;
//   double? totalSharesValue;
//   var returnOnInvestment;
//   List<PurchaseHistory>? purchaseHistory;

//   OwnedShares(
//       {this.id,
//       this.title,
//       this.shareValue,
//       this.numberOfOwnedShares,
//       this.totalSharesValue,
//       this.returnOnInvestment,
//       this.purchaseHistory});

//   OwnedShares.fromJson(Map<String, dynamic> json) {
//     id = json["_id"];
//     title = json["title"];
//     shareValue = json["shareValue"];
//     numberOfOwnedShares = json["numberOfOwnedShares"];
//     totalSharesValue = json["totalSharesValue"];
//     returnOnInvestment = json["returnOnInvestment"];
//     purchaseHistory = json["purchaseHistory"] == null
//         ? null
//         : (json["purchaseHistory"] as List)
//             .map((e) => PurchaseHistory.fromJson(e))
//             .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["_id"] = id;
//     data["title"] = title;
//     data["shareValue"] = shareValue;
//     data["numberOfOwnedShares"] = numberOfOwnedShares;
//     data["totalSharesValue"] = totalSharesValue;
//     data["returnOnInvestment"] = returnOnInvestment;
//     if (purchaseHistory != null) {
//       data["purchaseHistory"] =
//           purchaseHistory?.map((e) => e.toJson()).toList();
//     }
//     return data;
//   }
// }

// class PurchaseHistory {
//   String? date;
//   double? purchaseValue;
//   var numberOfShares;
//   double? totalPurchasePrice;

//   PurchaseHistory(
//       {this.date,
//       this.purchaseValue,
//       this.numberOfShares,
//       this.totalPurchasePrice});

//   PurchaseHistory.fromJson(Map<String, dynamic> json) {
//     date = json["date"];
//     purchaseValue = json["purchaseValue"];
//     numberOfShares = json["numberOfShares"];
//     totalPurchasePrice = json["totalPurchasePrice"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["date"] = date;
//     data["purchaseValue"] = purchaseValue;
//     data["numberOfShares"] = numberOfShares;
//     data["totalPurchasePrice"] = totalPurchasePrice;
//     return data;
//   }
// }
