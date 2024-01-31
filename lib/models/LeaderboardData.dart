class LeaderBoarData {
  String? fullName;
  int? balance;
  int? position;
  String? picture;
  bool? isYou;

  LeaderBoarData(
      {this.fullName, this.balance, this.position, this.picture, this.isYou});

  LeaderBoarData.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    balance=json['balance'];
    // if (json['balance'] != null) {
    //   balance = double.parse(json['balance']);
    // }
    position = json['position'];
    picture = json['picture'];
    isYou = json['isYou'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['balance'] = this.balance;
    data['position'] = this.position;
    data['picture'] = this.picture;
    data['isYou'] = this.isYou;
    return data;
  }
}
