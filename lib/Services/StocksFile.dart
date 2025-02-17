import 'dart:convert';
import 'dart:core';
import 'package:sms_postman/models/MarketStatusModel.dart';
import 'package:sms_postman/models/PortfolioData.dart';
import 'package:sms_postman/models/StocksData.dart';
import 'package:sms_postman/Services/AccessTokensFunctions.dart';
import 'package:http/http.dart' as http;
import 'package:sms_postman/models/Trendsks.dart';

List<Stocks> stocksd=[];
List<trendingsks> trend=[];
List<BuyOrders>? globalBuyOrders=[];
List<Protfoliodata> stocksd12=[];
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
    print("Failed to fetch stocks. Status code: ${response.statusCode}");
  }
}

Future fetchPortfolio() async {
  final actok = await getAccessToken();
  final response = await http.get(
    Uri.parse('https://smsapp.bits-postman-lab.in/portfolio'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      print(response.body);
      List<dynamic> jsonData = json.decode(response.body);
      stocksd12 = jsonData.map((data) => Protfoliodata.fromJson(data)).toList();
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to fetch portfolio and data. Status code: ${response.statusCode}");
    print(response.body);
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
        // print(response.body);
        MarketStates marketStates = MarketStates.fromJson(jsonData);
        globalBuyOrders = marketStates.buyOrders;
      } else {
        print("Invalid JSON format. Expected a Map.");
      }
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to fetch marketstatus. Status code: ${response.body}");
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
      // print(response.body);
      return true;
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to send market buy. Status code: ${response.statusCode}");
    // print(response.body);
    return false;
  }
}

Future sendIPOBuy(String stockId, int quantity) async {
  final actok = await getAccessToken();
  final response = await http.post(
    Uri.parse('https://smsapp.bits-postman-lab.in/ipo/buy'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
    body: jsonEncode(<String, dynamic>{
      "stock": stockId,
      "amount": quantity,
    }),
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      // print(response.body);
      return true;
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to IPO buy. Status code: ${response.body}");
    // print("Failed to buy. Status code: ${response.body}");
    // print(response.body);
    return false;
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
      // print(response.body);
      return true;
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to sell. Status code: ${response.statusCode}");
    // print(response.body);
    return false;
  }
}

Future Trendingstks() async {
  final actok = await getAccessToken();
  final response = await http.get(
    Uri.parse('https://smsapp.bits-postman-lab.in/stocks/trending'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      List<dynamic> jsonData = json.decode(response.body);
      trend = jsonData.map((data) => trendingsks.fromJson(data)).toList();
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to trending stocks. Status code: ${response.statusCode}");
  }
}