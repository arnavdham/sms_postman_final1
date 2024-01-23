import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sms_postman/Services/Colors.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  final List<Map<String, dynamic>> leaderboardData = [
    {
      'rank': '4',
      'imagePath': 'assets/ListLeaderboard.png',
      'text': 'Ruhika',
      'Points': '36'
    },
    {
      'rank': '5',
      'imagePath': 'assets/ListLeaderboard.png',
      'text': 'YOU',
      'Points': '36'
    },
    {
      'rank': '6',
      'imagePath': 'assets/ListLeaderboard.png',
      'text': 'Varun',
      'Points': '36'
    },
    {
      'rank': '7',
      'imagePath': 'assets/ListLeaderboard.png',
      'text': 'Ishita',
      'Points': '36'
    },
    {
      'rank': '8',
      'imagePath': 'assets/ListLeaderboard.png',
      'text': 'Saket',
      'Points': '36'
    },
    {
      'rank': '9',
      'imagePath': 'assets/ListLeaderboard.png',
      'text': 'Siddharth',
      'Points': '36'
    },
    {
      'rank': '10',
      'imagePath': 'assets/ListLeaderboard.png',
      'text': 'Abhishek',
      'Points': '36'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double pW = MediaQuery.of(context).size.width;
    double pH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 0),
              child: Image.asset('assets/bg1.png'),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Image.asset('assets/bg2.png'),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () {
                    if (ZoomDrawer.of(context)!.isOpen()) {
                      ZoomDrawer.of(context)!.close();
                    } else {
                      ZoomDrawer.of(context)!.open();
                    }
                  },
                  icon: SvgPicture.asset('assets/Drawer.svg'),
                ),
                //centerTitle: true,
                title: Text(
                  'Leaderboard',
                  style: TextStyle(
                    color: Color(0xFFF5F5F5),
                    fontSize: 24,
                    fontFamily: 'Gilroy-ExtraBold',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.48,
                  ),
                )),
          ),
          Column(
            children: [
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 10, vertical: pH * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 80),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: MyColors.color10, width: 3),
                              ),
                              child: SvgPicture.asset(
                                'assets/rank3.svg',
                                width: 60,
                                height: 100,
                              ),
                            ),
                            Positioned(
                              top: 65,
                              right: 27,
                              child: SvgPicture.asset(
                                'assets/Frame 430.svg',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                'Akshat Narayan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.40,
                                  fontFamily: 'Gilroy-Bold',
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                '43 pts',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'Gilroy-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: MyColors.color10, width: 3),
                              ),
                              child: SvgPicture.asset(
                                'assets/rank3.svg',
                                width: 60,
                                height: 100,
                              ),
                            ),
                            Positioned(
                              top: 68,
                              right: 31,
                              child: SvgPicture.asset(
                                'assets/Frame 430 (3).svg',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              'Arnav Dham',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.40,
                                fontFamily: 'Gilroy-Bold',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              '43 pts',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Gilroy-Regular',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 80),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: MyColors.color10, width: 3),
                              ),
                              child: SvgPicture.asset(
                                'assets/rank3.svg',
                                width: 60,
                                height: 100,
                              ),
                            ),
                            Positioned(
                              top: 70,
                              right: 29,
                              child: SvgPicture.asset(
                                'assets/Frame 430 (2).svg',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                'Arnav Dham',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.40,
                                  fontFamily: 'Gilroy-Bold',
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                '43 pts',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'Gilroy-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: leaderboardData.map((itemData) {
                      String rank = itemData['rank'];
                      String imagePath = itemData['imagePath'];
                      String text = itemData['text'];
                      String points = itemData['Points'];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: text == "YOU"
                                  ? ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(1.00, 0.00),
                                  end: Alignment(-1, 0),
                                  colors: [Color(0xFF8160FF),Color(0xFFFF28DE)],
                                ), // Change the color as needed
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              )
                                  : ShapeDecoration(
                                color: Color(0xFF221E42),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              height: 65,
                              width: double.infinity,
                              margin: EdgeInsets.only(left: 0, right: 0),
                              child: ListTile(
                                leading: Text(
                                  "$rank",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Gilroy-Bold',
                                    fontWeight: FontWeight.w500,
                                    height: 0.20,
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      child: Image.asset(imagePath),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            text,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.40,
                                              fontFamily: 'Gilroy-Bold',
                                              fontWeight: FontWeight.w500,
                                              height: 0.10,
                                            ),
                                          ),
                                          Text(
                                            "$points pts",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.40,
                                              fontFamily: 'Gilroy-Regular',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}