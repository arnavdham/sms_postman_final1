import 'dart:convert';
import 'package:sms_postman/models/LeaderboardData.dart';
import 'package:sms_postman/models/NewsData.dart';
import 'package:sms_postman/models/StocksData.dart';
import 'package:sms_postman/Services/AccessTokensFunctions.dart';
import 'package:http/http.dart' as http;
import 'package:sms_postman/models/userdata.dart';
String username='';
List<Stocks> stocksd=[];
List<Newsd>newsList=[];
List<UserProfile> userlist=[];
UserProfile? userdatbject;
List<LeaderBoarData> leader=[];

Future fetchStocks() async {
  final actok = await getAccessToken();
  final response = await http.get(
    Uri.parse('https://smsapp.bits-postman-lab.in/stocks'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      print(response.body);
      List<dynamic> jsonData = json.decode(response.body);
      stocksd = jsonData.map((data) => Stocks.fromJson(data)).toList();
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to fetch news. Status code: ${response.statusCode}");
  }
}

Future fetchLeaderboard() async {
  final actok = await getAccessToken();
  final response = await http.get(
    Uri.parse('https://smsapp.bits-postman-lab.in/leaderboard'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      List<dynamic> jsonData = json.decode(response.body);
      leader = jsonData.map((data) => LeaderBoarData.fromJson(data)).toList();
      // print(response.body);
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to fetch LeaderBoard. Status code: ${response.statusCode}");
  }
}

Future fetchNews() async {
  final actok = await getAccessToken();
  final response = await http.get(
    Uri.parse('https://smsapp.bits-postman-lab.in/news'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      List<dynamic> jsonData = json.decode(response.body);
      newsList = jsonData.map((data) => Newsd.fromJson(data)).toList();
      // print(response.body);
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to fetch news. Status code: ${response.statusCode}");
  }
}

Future fetchUser() async{
  final actok = await getAccessToken();
  final response = await http.get(
    Uri.parse('https://smsapp.bits-postman-lab.in/auth/userinfo'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      dynamic jsonData = json.decode(response.body);
      if (jsonData is Map<String, dynamic>) {
        // print(response.body);
        userlist = [UserProfile.fromJson(jsonData)];

        userdatbject=userlist[0];
      } else {
        print("Invalid JSON format. Expected a Map.");
      }
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to fetch news. Status code: ${response.statusCode}");
  }
}

Future fetchMarketStatus() async{
  final actok = await getAccessToken();
  final response = await http.get(
    Uri.parse('https://smsapp.bits-postman-lab.in/market/status'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      dynamic jsonData = json.decode(response.body);
      if (jsonData is Map<String, dynamic>) {
        print(response.body);
      } else {
        print("Invalid JSON format. Expected a Map.");
      }
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to fetch news. Status code: ${response.statusCode}");
  }
}

Future sendMarketBuy(String stockId, int quantity, int price) async {
  final actok = await getAccessToken();
  final response = await http.post(
    Uri.parse('https://smsapp.bits-postman-lab.in/market/buy'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
    body: jsonEncode(<String, dynamic>{
      "stock": stockId,
      "quantity": quantity,
      "price": price,
    }),
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      print(response.body);
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to buy. Status code: ${response.statusCode}");
    print(response.body);
  }
}

Future sellMarket(String stockId, int quantity, int price) async {
  final actok = await getAccessToken();
  final response = await http.post(
    Uri.parse('https://smsapp.bits-postman-lab.in/market/sell'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
    body: jsonEncode(<String, dynamic>{
      "stock": stockId,
      "quantity": quantity,
      "price": price,
    }),
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      print(response.body);
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to sell. Status code: ${response.statusCode}");
  }
}