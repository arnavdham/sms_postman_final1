import 'dart:convert';
import 'dart:core';
import 'package:sms_postman/Services/AccessTokensFunctions.dart';
import 'package:http/http.dart' as http;

List<Watlist> watchlistData=[];

class AddWatchlist {
  String? stock;

  AddWatchlist({this.stock});

  AddWatchlist.fromJson(Map<String, dynamic> json) {
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stock'] = this.stock;
    return data;
  }
}

Future addwatch(String stockId) async {
  final actok = await getAccessToken();
  final response = await http.post(
    Uri.parse('https://smsapp.bits-postman-lab.in/stocks/watchlist'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
    body: jsonEncode(<String, dynamic>{
      "stock": stockId,
    }),
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      print(response.body);
      return true;
    } else {
      print("Response body is null or empty.");
      return false;
    }
  } else {
    print("Failed to add watchlist. Status code: ${response.statusCode}");
    print(response.body);
  }
}

class Watlist {
  List<Watchlist>? watchlist;

  Watlist({this.watchlist});

  Watlist.fromJson(Map<String, dynamic> json) {
    if (json['watchlist'] != null) {
      watchlist = <Watchlist>[];
      json['watchlist'].forEach((v) {
        watchlist!.add(new Watchlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.watchlist != null) {
      data['watchlist'] = this.watchlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Watchlist {
  String? name;
  String? symbol;
  int? price;
  bool? isCrypto;
  bool? isStock;
  String? addedAt;

  Watchlist(
      {this.name,
        this.symbol,
        this.price,
        this.isCrypto,
        this.isStock,
        this.addedAt});

  Watchlist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    price = json['price'];
    isCrypto = json['isCrypto'];
    isStock = json['isStock'];
    addedAt = json['addedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['price'] = this.price;
    data['isCrypto'] = this.isCrypto;
    data['isStock'] = this.isStock;
    data['addedAt'] = this.addedAt;
    return data;
  }
}

Future watch() async {
  final actok = await getAccessToken();
  final response = await http.get(
    Uri.parse('https://smsapp.bits-postman-lab.in/stocks/watchlist'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      print(response.body);
      // List<dynamic> jsonData = json.decode(response.body);
      // watcdatalist = jsonData.map((data) =>Watlist.fromJson(data)).toList();
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to get watchlist. Status code: ${response.statusCode}");
    print(response.body);
  }
}