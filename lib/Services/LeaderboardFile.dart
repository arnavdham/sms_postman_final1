import 'dart:convert';
import 'dart:core';
import 'package:sms_postman/models/LeaderboardData.dart';
import 'package:sms_postman/Services/AccessTokensFunctions.dart';
import 'package:http/http.dart' as http;

List<LeaderBoarData> leader=[];
int? leaderboardposition;

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
      print(response.body);
      String displayedText;
      for (int i = 0; i < leader.length; i++) {
        if (leader[i].isYou.toString() == "true") {
          leaderboardposition = leader[i].position;
        }
        if (leader[i].fullName.toString().split(' ').length > 2) {
          displayedText = leader[i].fullName.toString().split(' ').take(2).join(' ');
          leader[i].fullName=displayedText;
        } else {
          displayedText = leader[i].fullName.toString();
          leader[i].fullName=displayedText;
        }
      }
      // print(leaderboardposition);
    } else {
      print("Response body is null or empty.");
    }
  } else {
    print("Failed to fetch LeaderBoard. Status code: ${response.statusCode}");
  }
}