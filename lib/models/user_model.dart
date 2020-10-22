class UserModel {
  Name name;
  String email;
  String dob;
  String avatar;
  String phoneNumber;
  Location location;
  Preferences preferences;
  Sexuality sexuality;
  Details details;
  String aboutMe;
  Kids kids;
  String pets;
  LookingFor lookingFor;

  UserModel({
    this.name,
    this.email,
    this.dob,
    this.avatar,
    this.phoneNumber,
    this.location,
    this.preferences,
    this.sexuality,
    this.details,
    this.aboutMe,
    this.kids,
    this.pets,
    this.lookingFor,
  });

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    email = json['email'];
    dob = json['dob'];
    avatar = json['avatar'];
    phoneNumber = json['phone-number'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    preferences = json['preferences'] != null
        ? new Preferences.fromJson(json['preferences'])
        : null;
    sexuality = json['sexuality'] != null
        ? new Sexuality.fromJson(json['sexuality'])
        : null;
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
    aboutMe = json['about-me'];
    kids = json['kids'] != null ? new Kids.fromJson(json['kids']) : null;
    pets = json['pets'];
    lookingFor = json['looking-for'] != null
        ? new LookingFor.fromJson(json['looking-for'])
        : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['avatar'] = this.avatar;
    data['phone-number'] = this.phoneNumber;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.preferences != null) {
      data['preferences'] = this.preferences.toJson();
    }
    if (this.sexuality != null) {
      data['sexuality'] = this.sexuality.toJson();
    }
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    data['about-me'] = this.aboutMe;
    if (this.kids != null) {
      data['kids'] = this.kids.toJson();
    }
    data['pets'] = this.pets;
    if (this.lookingFor != null) {
      data['looking-for'] = this.lookingFor.toJson();
    }
    return data;
  }
}

class Name {
  String firstName;
  String lastName;

  Name({this.firstName, this.lastName});

  Name.fromJson(Map<dynamic, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}

class Location {
  String country;
  String city;

  Location({this.country, this.city});

  Location.fromJson(Map<dynamic, dynamic> json) {
    country = json['country'];
    city = json['city'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['country'] = this.country;
    data['city'] = this.city;
    return data;
  }
}

class Preferences {
  int height;
  String bodyType;
  String diet;
  String smoking;
  String drinking;

  Preferences(
      {this.height, this.bodyType, this.diet, this.smoking, this.drinking});

  Preferences.fromJson(Map<dynamic, dynamic> json) {
    height = json['height'];
    bodyType = json['body-type'];
    diet = json['diet'];
    smoking = json['smoking'];
    drinking = json['drinking'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['height'] = this.height;
    data['body-type'] = this.bodyType;
    data['diet'] = this.diet;
    data['smoking'] = this.smoking;
    data['drinking'] = this.drinking;
    return data;
  }
}

class Sexuality {
  String gender;
  List<String> orientation;
  String relationship;

  Sexuality({this.gender, this.orientation, this.relationship});

  Sexuality.fromJson(Map<dynamic, dynamic> json) {
    gender = json['gender'];
    orientation = json['orientation'].cast<String>();
    relationship = json['relationship'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['gender'] = this.gender;
    data['orientation'] = this.orientation;
    data['relationship'] = this.relationship;
    return data;
  }
}

class Details {
  String ethnicity;
  String religion;
  String sign;
  String politics;
  String education;
  List<String> languages;

  Details(
      {this.ethnicity,
      this.religion,
      this.sign,
      this.politics,
      this.education,
      this.languages});

  Details.fromJson(Map<dynamic, dynamic> json) {
    ethnicity = json['ethnicity'];
    religion = json['religion'];
    sign = json['sign'];
    politics = json['politics'];
    education = json['education'];
    languages = json['languages'].cast<String>();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['ethnicity'] = this.ethnicity;
    data['religion'] = this.religion;
    data['sign'] = this.sign;
    data['politics'] = this.politics;
    data['education'] = this.education;
    data['languages'] = this.languages;
    return data;
  }
}

class Kids {
  bool hasKids;
  String wantKids;

  Kids({this.hasKids, this.wantKids});

  Kids.fromJson(Map<dynamic, dynamic> json) {
    hasKids = json['has-kids'];
    wantKids = json['want-kids'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['has-kids'] = this.hasKids;
    data['want-kids'] = this.wantKids;
    return data;
  }
}

class LookingFor {
  List<String> purpose;
  List<int> ageBtw;
  List<String> gender;

  LookingFor({this.purpose, this.ageBtw, this.gender});

  LookingFor.fromJson(Map<dynamic, dynamic> json) {
    purpose = json['purpose'].cast<String>();
    ageBtw = json['age-btw'].cast<int>();
    gender = json['gender'].cast<String>();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['purpose'] = this.purpose;
    data['age-btw'] = this.ageBtw;
    data['gender'] = this.gender;
    return data;
  }
}
