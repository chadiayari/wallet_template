class LoggedInUser {
  String? id;
  String? firstName;
  String? emiratesId;
  String? preferredEmail;
  int? preferredPhoneNumber;
  String? gender;
  Emirates? emirates;
  dynamic portfolioId;
  int? phoneNumber;
  String? address;
  String? lastName;
  String? email;
  bool? isAdmin;
  List<Logs>? logs;
  String? token;

  LoggedInUser(
      {this.id,
      this.firstName,
      this.emiratesId,
      this.preferredEmail,
      this.preferredPhoneNumber,
      this.gender,
      this.emirates,
      this.portfolioId,
      this.phoneNumber,
      this.address,
      this.lastName,
      this.email,
      this.isAdmin,
      this.logs,
      this.token});

  LoggedInUser.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    firstName = json["firstName"];
    emiratesId = json["emiratesId"];
    preferredEmail = json["preferredEmail"];
    preferredPhoneNumber = json["preferredPhoneNumber"];
    gender = json["gender"];
    emirates =
        json["emirates"] == null ? null : Emirates.fromJson(json["emirates"]);
    portfolioId = json["portfolioId"];
    phoneNumber = json["phoneNumber"];
    address = json["address"];
    lastName = json["lastName"];
    email = json["email"];
    isAdmin = json["isAdmin"];
    logs = json["logs"] == null
        ? null
        : (json["logs"] as List).map((e) => Logs.fromJson(e)).toList();
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["firstName"] = firstName;
    data["emiratesId"] = emiratesId;
    data["preferredEmail"] = preferredEmail;
    data["preferredPhoneNumber"] = preferredPhoneNumber;
    data["gender"] = gender;
    if (emirates != null) data["emirates"] = emirates?.toJson();
    data["phoneNumber"] = phoneNumber;
    data["address"] = address;
    data["lastName"] = lastName;
    data["email"] = email;
    data["isAdmin"] = isAdmin;
    data["portfolioId"] = portfolioId;
    if (logs != null) data["logs"] = logs?.map((e) => e.toJson()).toList();
    data["token"] = token;
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
