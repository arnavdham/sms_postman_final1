import 'dart:convert';
import 'package:sms_postman/models/NewsData.dart';
import 'package:sms_postman/models/StocksData.dart';
import 'package:sms_postman/Services/AccessTokensFunctions.dart';
import 'package:http/http.dart' as http;
import 'package:sms_postman/models/UserInfo.dart';
import 'package:sms_postman/models/userdata.dart';
String username='';
List<Stocks> stocksd=[];
List<Newsd>newsList=[];
List<UserProfile> userlist=[];
UserProfile? userdatbject;

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
      List<dynamic> jsonData = json.decode(response.body);
      stocksd = jsonData.map((data) => Stocks.fromJson(data)).toList();
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to fetch news. Status code: ${response.statusCode}");
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