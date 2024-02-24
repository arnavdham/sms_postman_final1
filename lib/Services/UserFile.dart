import 'dart:convert';
import 'dart:core';
import 'package:sms_postman/Services/AccessTokensFunctions.dart';
import 'package:http/http.dart' as http;
import 'package:sms_postman/models/userdata.dart';

String username='';
List<UserProfile> userlist=[];
UserProfile? userdatbject;

int count=0;
int balanced = userdatbject!.balance as int;
double percent = (balanced / 10000)-1;
double profits=balanced-10000;
double balpercent=(balanced/10000);

Future<void> updateValues() async {
  balanced = userdatbject!.balance as int;
  percent = (balanced / 10000) - 1;
  profits = balanced - 10000;
  balpercent = balanced / 10000;
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
        print(response.body);
        userlist = [UserProfile.fromJson(jsonData)];
        userdatbject=userlist[0];
      } else {
        print("Invalid JSON format. Expected a Map.");
      }
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to fetch user. Status code: ${response.statusCode}");
    // print(response.body);
  }
}

// Future fetchMarketStatus() async{
//   final actok = await getAccessToken();
//   final response = await http.get(
//     Uri.parse('https://smsapp.bits-postman-lab.in/market/status'),
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': actok.toString(),
//     },
//   );
//   if (response.statusCode == 200) {
//     if (response.body != null && response.body.isNotEmpty) {
//       dynamic jsonData = json.decode(response.body);
//       if (jsonData is Map<String, dynamic>) {
//         // print(response.body);
//         MarketStates marketStates = MarketStates.fromJson(jsonData);
//         globalBuyOrders = marketStates.buyOrders;
//       } else {
//         print("Invalid JSON format. Expected a Map.");
//       }
//     } else {
//       print("Response body is null or empty.");
//     }
//   } else {
//     print("Failed to fetch marketstatus. Status code: ${response.body}");
//   }
// }
//
// Future sendMarketBuy(String stockId, int quantity, int price) async {
//   final actok = await getAccessToken();
//   final response = await http.post(
//     Uri.parse('https://smsapp.bits-postman-lab.in/market/buy'),
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': actok.toString(),
//     },
//     body: jsonEncode(<String, dynamic>{
//       "stock": stockId,
//       "quantity": quantity,
//       "price": price,
//     }),
//   );
//   if (response.statusCode == 200) {
//     if (response.body != null && response.body.isNotEmpty) {
//       // print(response.body);
//       return true;
//     } else {
//       print("Response body is null or empty.");
//     }
//   } else {
//     print("Failed to buy. Status code: ${response.statusCode}");
//     // print(response.body);
//     return false;
//   }
// }
//
// Future sendIPOBuy(String stockId, int quantity) async {
//   final actok = await getAccessToken();
//   final response = await http.post(
//     Uri.parse('https://smsapp.bits-postman-lab.in/ipo/buy'),
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': actok.toString(),
//     },
//     body: jsonEncode(<String, dynamic>{
//       "stock": stockId,
//       "amount": quantity,
//     }),
//   );
//   if (response.statusCode == 200) {
//     if (response.body != null && response.body.isNotEmpty) {
//       // print(response.body);
//       return true;
//     } else {
//       print("Response body is null or empty.");
//     }
//   } else {
//     print("Failed to IPO buy. Status code: ${response.body}");
//     // print("Failed to buy. Status code: ${response.body}");
//     // print(response.body);
//     return false;
//   }
// }
//
// Future sellMarket(String stockId, int quantity, int price) async {
//   final actok = await getAccessToken();
//   final response = await http.post(
//     Uri.parse('https://smsapp.bits-postman-lab.in/market/sell'),
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': actok.toString(),
//     },
//     body: jsonEncode(<String, dynamic>{
//       "stock": stockId,
//       "quantity": quantity,
//       "price": price,
//     }),
//   );
//   if (response.statusCode == 200) {
//     if (response.body != null && response.body.isNotEmpty) {
//       // print(response.body);
//       return true;
//     } else {
//       print("Response body is null or empty.");
//     }
//   } else {
//     print("Failed to sell. Status code: ${response.statusCode}");
//     // print(response.body);
//     return false;
//   }
// }
//
// Future Trendingstks() async {
//   final actok = await getAccessToken();
//   final response = await http.get(
//     Uri.parse('https://smsapp.bits-postman-lab.in/stocks/trending'),
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': actok.toString(),
//     },
//   );
//   if (response.statusCode == 200) {
//     if (response.body != null && response.body.isNotEmpty) {
//       List<dynamic> jsonData = json.decode(response.body);
//       trend = jsonData.map((data) => trendingsks.fromJson(data)).toList();
//     } else {
//       print("Response body is null or empty.");
//     }
//   } else {
//     print("Failed to sell. Status code: ${response.statusCode}");
//   }
// }