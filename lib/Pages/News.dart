import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sms_postman/Services/AccessTokensFunctions.dart';
import 'package:sms_postman/Services/ConstantFile.dart';
import 'package:sms_postman/models/NewsData.dart';
import 'package:intl/intl.dart';

class NewsTile extends StatelessWidget {
  final String newsType;
  final String newsDescription;
  final String timeSincePosted;

  NewsTile({required this.newsType, required this.newsDescription, required this.timeSincePosted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16,0,16,0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        //borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3.0,),
          Text(
            newsType,
            style: TextStyle(
              color: Color(0xFFF5F5F5),
              fontSize: 14,
              fontFamily: 'Gilroy-Medium',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.56,
            ),
          ),
          SizedBox(height: 8),
          Container(
            child: Text(
              newsDescription,
              style: TextStyle(
                color: Color(0xFFF5F5F5),
                fontSize: 18,
                fontFamily: 'Gilroy-Bold',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.72,
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                timeSincePosted,
                style: TextStyle(
                  color: Color(0xFFF5F5F5),
                  fontSize: 14,
                  fontFamily: 'Gilroy-Medium',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.56,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  // Handle button press here
                },
                icon: Icon(Icons.chevron_right,size: 35,color: Colors.white,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<Newsd>newsList=[];
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
  @override
  void initState() {
    super.initState();
    fetchNews();
  }
  @override
  Widget build(BuildContext context) {
    double pW = MediaQuery.of(context).size.width;
    double pH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body:Stack(
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
                // centerTitle: true,
                title: Text(
                  'News',
                  style: TextStyle(
                    color: Color(0xFFF5F5F5),
                    fontSize: 24,
                    fontFamily: 'Gilroy-Bold',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.48,
                  ),
                )
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height:pH*0.1),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.only(left:15),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Headlines of the Day',
                      style: TextStyle(
                        color: Color(0xFFF5F5F5),
                        fontSize: 24,
                        fontFamily: 'Gilroy-Bold',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.96,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        NewsTile(
                          newsType: 'Business',
                          newsDescription: newsList[index].title.toString(),
                          timeSincePosted: newsList[index].timeAgo.toString(),
                        ),
                        Divider( // Divider between list items
                          height: 1,
                          color: Color(0xff515151),
                          thickness: 4,
                        ),
                        SizedBox(height: 5.0,),
                      ],
                    );
                  },
                ),
              ),
              // Container(
              //   color: Colors.black,
              //   alignment: Alignment.center,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       TextButton(
              //         onPressed: () {},
              //         child: Text("Latest News >", style: TextStyle(fontSize: 20,color: Colors.white)),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

}