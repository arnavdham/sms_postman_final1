import 'dart:convert';
import 'dart:core';
import 'package:sms_postman/models/NewsArticleData.dart';
import 'package:sms_postman/models/NewsData.dart';
import 'package:sms_postman/Services/AccessTokensFunctions.dart';
import 'package:http/http.dart' as http;

List<Newsd>newsList=[];
List<NewsArticleData> newsArticleList = [];
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
      print(response.body);
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to fetch news. Status code: ${response.statusCode}");
  }
}

Future fetchNewsArticle(String id) async {
  final actok = await getAccessToken();
  final response = await http.get(
    Uri.parse('https://smsapp.bits-postman-lab.in/news/$id'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': actok.toString(),
    },
  );
  if (response.statusCode == 200) {
    if (response.body != null && response.body.isNotEmpty) {
      // List<dynamic> jsonData = json.decode(response.body);
      // newsList = jsonData.map((data) => Newsd.fromJson(data)).toList();
      print(response.body);
      final jsonData = json.decode(response.body);
      if (jsonData != null) {
        if (jsonData is List) {
          for (var item in jsonData) {
            newsArticleList.add(NewsArticleData.fromJson(item));
            print(newsArticleList.toString());
          }
        } else {
          // print(NewsArticleData.fromJson(jsonData).sentiment?.user);
          // print(NewsArticleData.fromJson(jsonData).sentiment?.articles?.dislikeCount.toString());
          newsArticleList.add(NewsArticleData.fromJson(jsonData));
          print('Helo');
        }
      }
      // print(response.body);
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to fetch news article. Status code: ${response.statusCode}");
  }
}