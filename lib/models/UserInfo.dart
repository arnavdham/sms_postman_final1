class Userinfotaken {
  String? accessToken;
  User? user;

  Userinfotaken({this.accessToken, this.user});

  Userinfotaken.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? email;
  String? fullName;
  String? id;
  String? picture;

  User({this.email, this.fullName, this.id, this.picture});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['fullName'];
    id = json['id'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['id'] = this.id;
    data['picture'] = this.picture;
    return data;
  }
}
