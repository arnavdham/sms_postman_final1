class UserProfile {
  String? fullName;
  String? email;
  String? picture;
  String? balance;

  UserProfile({this.fullName, this.email, this.picture, this.balance});

  UserProfile.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    picture = json['picture'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['picture'] = this.picture;
    data['balance'] = this.balance;
    return data;
  }
}
