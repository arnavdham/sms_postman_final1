import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sms_postman/Pages/Portfolio.dart';
import 'package:sms_postman/Services/Colors.dart';
import 'package:sms_postman/Services/ConstantFile.dart';

class NewsTile extends StatelessWidget {
  final String newsType;
  final String newsDescription;
  final String timeSincePosted;
  final String newstitle;
  final String idnews;
  NewsTile({required this.newsType, required this.newsDescription, required this.timeSincePosted,required this.newstitle,required this.idnews});

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsCardView(
                        createdat: timeSincePosted,
                        newstitle: newstitle,
                        newsdescription: newsDescription,
                        idno:idnews,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.chevron_right,size: 35,color: Colors.white,),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                ),
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
  @override
  void initState() {
    super.initState();
    fetchNews();
  }
  @override
  Widget build(BuildContext context) {
    double pW = MediaQuery.of(context).size.width;
    double pH = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future:fetchUser(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
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
                                  newsDescription: newsList[index].content.toString(),
                                  timeSincePosted: newsList[index].timeAgo.toString(),
                                  newstitle:newsList[index].title.toString(),
                                  idnews: newsList[index].id.toString(),
                                ),
                                Opacity(
                                  opacity:0.5,
                                  child: Divider(
                                    height: 1,
                                    color: Color(0xff515151),
                                    thickness: 3,
                                  ),
                                ),
                                SizedBox(height: 5.0,),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        }
    );
  }

}

class NewsCardView extends StatelessWidget {
  final String newstitle;
  final String newsdescription;
  final String createdat;
  final String idno;

  NewsCardView({
    Key? key,
    required this.newstitle,
    required this.newsdescription,
    required this.createdat,
    required this.idno,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pW = MediaQuery.of(context).size.width;
    double pH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: pH,
        width: pW,
        child: Stack(
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
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                centerTitle: false,
                iconTheme: IconThemeData(color: Colors.white),
                title: Text(
                  'News',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontFamily: 'CircularSpotifyTxT-Bold',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0,8.0,8.0,8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: pH * 0.1,
                  ),
                  Container(
                    width:pW,
                      height: pH*0.26,
                      child: Image.asset(
                          'assets/newsimage.png',
                      ),
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                          ),
                          color: MyColors.color16,
                        ),
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(height:pH*0.05),
                            Container(
                              width: pW*0.84,
                              child: Text(
                                newstitle,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height:pH*0.024),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    '250 views',
                                    style:TextStyle(
                                      color:Colors.white,
                                    )
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width:pW*0.035,
                                      height:pH*0.014                                                                   ,
                                      child: Image.asset(
                                          'assets/Clock.png',
                                      ),
                                    ),
                                    SizedBox(width: pW*0.01,),
                                    Container(
                                      child: Text(
                                          createdat,
                                          style:TextStyle(
                                            color:Colors.white,
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height:pH*0.021),
                            Container(
                              width: pW*0.915,
                              height:pH*0.21,
                              child:Text(
                                newsdescription,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height:pH*0.01),
                            Container(
                              width: double.infinity,
                              child: Divider(
                                color: Color(0xFF515151),
                                thickness: 2,
                              ),
                            ),
                            SizedBox(height:pH*0.01),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    'Comments',
                                    style:TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
