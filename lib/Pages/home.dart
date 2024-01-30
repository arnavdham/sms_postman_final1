import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_postman/Pages/Portfolio.dart';
import 'package:sms_postman/Services/ConstantFile.dart';
import '../Services/Colors.dart';
import 'Crypto.dart';
import 'Loading.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    double pW = MediaQuery.of(context).size.width;
    double pH = MediaQuery.of(context).size.height;
    bool load = false;
    Widget _buildContent() {
      return Column(
        children: [
          Container(
            height: pH*0.21,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 12,0,11),
                    color: MyColors.color2,
                    child: Row(
                      children: [
                        Image.asset(
                            'assets/google.png',
                        ),
                        SizedBox(width: pW*0.026,),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontFamily: 'CircularSpotifyTxT-Bold',
                          ),
                        ),
                        SizedBox(width: pW*0.08,),
                        Image.asset('assets/graphloss.png'),
                        SizedBox(width:pW*0.13),
                        Column(
                          children: [
                            Text(
                              '\$ 2,174.75',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                            Text(
                              '-0.21%',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.red,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width:pW*0.04),
                      ],
                    ),
                  ),
                  SizedBox(height:1.h),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 12,0,11),
                    color: MyColors.color2,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google.png',
                        ),
                        SizedBox(width: pW*0.026,),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontFamily: 'CircularSpotifyTxT-Bold',
                          ),
                        ),
                        SizedBox(width: pW*0.08,),
                        Image.asset('assets/Graphprofit.png'),
                        SizedBox(width:pW*0.13),
                        Column(
                          children: [
                            Text(
                              '\$ 2,174.75',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                            Text(
                              '+5.21%',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.green,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width:pW*0.04),
                      ],
                    ),
                  ),
                  SizedBox(height:1.h),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 12,0,11),
                    color: MyColors.color2,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google.png',
                        ),
                        SizedBox(width: pW*0.026,),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontFamily: 'CircularSpotifyTxT-Bold',
                          ),
                        ),
                        SizedBox(width: pW*0.08,),
                        Image.asset('assets/graphloss.png'),
                        SizedBox(width:pW*0.13),
                        Column(
                          children: [
                            Text(
                              '\$ 2,174.75',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                            Text(
                              '-0.21%',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.red,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width:pW*0.04),
                      ],
                    ),
                  ),
                  SizedBox(height:1.h),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 12,0,11),
                    color: MyColors.color2,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google.png',
                        ),
                        SizedBox(width: pW*0.026,),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontFamily: 'CircularSpotifyTxT-Bold',
                          ),
                        ),
                        SizedBox(width: pW*0.08,),
                        Image.asset('assets/graphloss.png'),
                        SizedBox(width:pW*0.13),
                        Column(
                          children: [
                            Text(
                              '\$ 2,174.75',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                            Text(
                              '-0.21%',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.red,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width:pW*0.04),
                      ],
                    ),
                  ),
                  SizedBox(height:1.h),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 12,0,11),
                    color: MyColors.color2,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google.png',
                        ),
                        SizedBox(width: pW*0.026,),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontFamily: 'CircularSpotifyTxT-Bold',
                          ),
                        ),
                        SizedBox(width: pW*0.08,),
                        Image.asset('assets/Graphprofit.png'),
                        SizedBox(width:pW*0.13),
                        Column(
                          children: [
                            Text(
                              '\$ 2,174.75',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                            Text(
                              '+5.21%',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.green,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width:pW*0.04),
                      ],
                    ),
                  ),
                  SizedBox(height:1.h),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 12,0,11),
                    color: MyColors.color2,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google.png',
                        ),
                        SizedBox(width: pW*0.026,),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontFamily: 'CircularSpotifyTxT-Bold',
                          ),
                        ),
                        SizedBox(width: pW*0.08,),
                        Image.asset('assets/Graphprofit.png'),
                        SizedBox(width:pW*0.13),
                        Column(
                          children: [
                            Text(
                              '\$ 2,174.75',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                            Text(
                              '+5.21%',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.green,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width:pW*0.04),
                      ],
                    ),
                  ),
                  SizedBox(height:1.h),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 12,0,11),
                    color: MyColors.color2,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google.png',
                        ),
                        SizedBox(width: pW*0.026,),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontFamily: 'CircularSpotifyTxT-Bold',
                          ),
                        ),
                        SizedBox(width: pW*0.08,),
                        Image.asset('assets/graphloss.png'),
                        SizedBox(width:pW*0.13),
                        Column(
                          children: [
                            Text(
                              '\$ 2,174.75',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                            Text(
                              '-0.21%',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.red,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width:pW*0.04),
                      ],
                    ),
                  ),
                  SizedBox(height:1.h),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 12,0,11),
                    color: MyColors.color2,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google.png',
                        ),
                        SizedBox(width: pW*0.026,),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontFamily: 'CircularSpotifyTxT-Bold',
                          ),
                        ),
                        SizedBox(width: pW*0.08,),
                        Image.asset('assets/graphloss.png'),
                        SizedBox(width:pW*0.13),
                        Column(
                          children: [
                            Text(
                              '\$ 2,174.75',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                            Text(
                              '-0.21%',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.red,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width:pW*0.04),
                      ],
                    ),
                  ),
                  SizedBox(height:1.h),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 12,0,11),
                    color: MyColors.color2,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google.png',
                        ),
                        SizedBox(width: pW*0.026,),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontFamily: 'CircularSpotifyTxT-Bold',
                          ),
                        ),
                        SizedBox(width: pW*0.08,),
                        Image.asset('assets/Graphprofit.png'),
                        SizedBox(width:pW*0.13),
                        Column(
                          children: [
                            Text(
                              '\$ 2,174.75',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                            Text(
                              '+5.21%',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.green,
                                fontFamily: 'CircularSpotifyTxT-Bold',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width:pW*0.04),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    return (load)
        ? Loading()
        : FutureBuilder(
        future:fetchUser(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
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
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                            splashFactory: NoSplash.splashFactory,
                          ),
                        ),
                        centerTitle: false,
                        title: Text(
                          'Home',
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
                            child: Stack(
                              children: [
                                Transform.rotate(
                                  angle: 15.68,
                                  child: Container(
                                    width: pW * 0.91,
                                    height: pH*0.17,
                                    decoration: BoxDecoration(
                                        color: MyColors.color22,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                ),

                                Container(
                                  width: pW * 0.91,
                                  height: pH*0.17,
                                  decoration: BoxDecoration(
                                      color: MyColors.color11,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Image.asset(
                                    'assets/Group 79.png',
                                  ),
                                ),
                                Container(
                                  width: pW * 0.91,
                                  height: pH*0.17,
                                  decoration: BoxDecoration(
// color: MyColors.color11,
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Padding(
                                    padding:EdgeInsets.fromLTRB(16.0,pH*0.023,16,pH*0.0128),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: pH*0.0186,
// width: pW*0.226,
                                          child: Text(
                                            'Total Balance',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                              fontFamily: 'CircularSpotifyTxT-Bold',
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: pH*0.0128),
                                        Container(
                                          height: pH*0.0442,
// width: pW*0.5,
                                          child: Text(
                                            '\$ ${userdatbject!.balance.toString()}',
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'CircularSpotifyTxT-Bold',
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: pH*0.0128),
                                        Container(
                                          padding: EdgeInsets.only(left: pW*0.042,top: pH*0.0058,bottom: pH*0.0058,right: pW*0.024),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(40),
                                            border: Border.all(
                                              color: MyColors.color21,
                                              width: pW*0.00266,
                                            ),
                                          ),
                                          child: Container(
                                            width:pW*0.43536,
// height: pH*0.032,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "today's earning",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontFamily: 'CircularSpotifyTxT-Bold',
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: pW*0.0266,
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                  child: Container(
                                                    color: MyColors.color12,
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/profit.svg',
                                                        ),
                                                        SizedBox(width: pW*0.0026,),
                                                        Text(
                                                          "7.64%",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: MyColors.white,
                                                            fontFamily: 'CircularSpotifyTxT-Bold',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: pH * 0.03,
                          ),
                          Container(
                            width: pW * 0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: pW*0.44,
                                  height: pH*0.09,
                                  decoration: BoxDecoration(
                                    color: MyColors.color16,
                                    borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Crypto()));

                                    },
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                                      splashFactory: NoSplash.splashFactory,
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: pH*0.003,),
                                        SvgPicture.asset(
                                          'assets/cashback.svg',
                                        ),
                                        Text(
                                          'Crypto',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontFamily: 'CircularSpotifyTxT-Bold',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyColors.color16,
                                    borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
                                  ),
                                  width: pW*0.44,
                                  height: pH*0.09,
                                  child: TextButton(
                                    onPressed: () {
                                    },
                                    style: ButtonStyle(
                                      splashFactory: NoSplash.splashFactory,
                                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: pH*0.003,),
                                        SvgPicture.asset(
                                          'assets/Analysis.svg',
                                        ),
                                        Text(
                                          'Explore Stocks',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontFamily: 'CircularSpotifyTxT-Bold',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: pH*0.012,),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Trending Stocks',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: 'CircularSpotifyTxT-Bold',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: pH*0.01,
                                ),
                                Container(
                                  height: pH * 0.14,
                                  width: double.infinity,
                                  color: Colors.transparent,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      StockCard(
                                        imageUrl: 'assets/share3.svg',
                                        name: 'BRRI',
                                        price: '8,600',
                                        change: '+50(+3.23%)',
                                      ),
                                      StockCard(
                                        imageUrl: 'assets/share3.svg',
                                        name: 'ARB',
                                        price: '\$90.00',
                                        change: '-\$5.00',
                                      ),
                                      StockCard(
                                        imageUrl: 'assets/share3.svg',
                                        name: 'FSX',
                                        price: '\$110.00',
                                        change: '+\$15.00',
                                      ),
                                      StockCard(
                                        imageUrl: 'assets/share3.svg',
                                        name: 'Stock 4',
                                        price: '\$110.00',
                                        change: '-\$15.00',
                                      ),
                                      StockCard(
                                        imageUrl: 'assets/share3.svg',
                                        name: 'Stock 5',
                                        price: '\$110.00',
                                        change: '+\$15.00',
                                      ),
                                      StockCard(
                                        imageUrl: 'assets/share3.svg',
                                        name: 'Stock 6',
                                        price: '\$110.00',
                                        change: '\$0.00',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(16,8,16,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Watchlist',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: 'CircularSpotifyTxT-Bold',
                                  ),
                                ),
                                IconButton(
                                  icon: SvgPicture.asset('assets/addpink.svg'),
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                                    splashFactory: NoSplash.splashFactory,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:EdgeInsets.all(8.0),
                            child: _buildContent(), // Call the content method
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
    );
  }
}

class StockCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String change;

  StockCard({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.315,
      margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
      decoration: BoxDecoration(
        color: MyColors.color11,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16,8,16,8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  imageUrl,
                  width: MediaQuery.of(context).size.width*0.053,
                  height: MediaQuery.of(context).size.height*0.0232,
                ),
                SizedBox(width: 8),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'CircularSpotifyTxT-Bold',
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'CircularSpotifyTxT-Bold',
              ),
            ),
            SizedBox(height: 4),
            Text(
              change,
              style: TextStyle(
                color: change.startsWith('+')
                    ? Colors.green
                    : change.startsWith('-')
                        ? Colors.red
                        : Colors.white,
                fontSize: 11,
                fontFamily: 'CircularSpotifyTxT-Bold',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
