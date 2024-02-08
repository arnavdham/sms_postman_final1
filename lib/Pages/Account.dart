import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sms_postman/Pages/drawer_screen.dart';
import 'package:sms_postman/Pages/home.dart';
import 'package:sms_postman/Pages/home_wrapper.dart';
import 'package:sms_postman/Services/ConstantFile.dart';
import 'package:sms_postman/Services/Navbar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => DrawerScreen()),
                            );
                          },
                        ),
                        iconTheme: IconThemeData(color: Colors.white),
                        centerTitle: false,
                        title: Text(
                          'Account',
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
                            width: pW*0.8,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: pW * 0.27,
                                    height: pH * 0.127,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(userdatbject!.picture.toString()),
                                        fit: BoxFit.cover,
                                      ),
                                      shape: OvalBorder(
                                        side: BorderSide(width: 1.5, color: Color(0xFF704EF4)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        userdatbject!.fullName.toString(),
                                        style: TextStyle(
                                          color: Color(0xFFCBD5E1),
                                          fontSize: 30,
                                          fontFamily: 'Gilroy-Bold',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Since 2022',
                                        style: TextStyle(
                                          color: Color(0xFFCBD5E1),
                                          fontSize: 20,
                                          fontFamily: 'Gilroy-Medium',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height:pH*0.07,
                          ),
                          Container(
                            width: pW*0.98,
                            decoration: ShapeDecoration(
                              color: Color(0x00E0D6D6),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 2, color: Color(0xFFCBD5E1)),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Total Balance',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFF5F5F5),
                                        fontSize: 20,
                                        fontFamily: 'Gilroy-Bold',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      userdatbject!.balance.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF704EF4),
                                        fontSize: 21,
                                        fontFamily: 'Gilroy-Bold',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height:pH*0.099,
                                  decoration: ShapeDecoration(
                                    color: Color(0x00E0D6D6),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1, color: Color(0xFFCBD5E1)),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Leaderboard',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFF5F5F5),
                                        fontSize: 20,
                                        fontFamily: 'Gilroy-Bold',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '6th',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF704EF4),
                                        fontSize: 21,
                                        fontFamily: 'Gilroy-Bold',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height:pH*0.07,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/hearts.svg',
                                      width: pW*0.088,
                                      height:pH*0.0415,
                                    ),
                                    SizedBox(width: pW*0.05,),
                                    Text(
                                      'Your Favorite',
                                      style: TextStyle(
                                        color: Color(0xFFCBD5E1),
                                        fontSize: 20,
                                        fontFamily: 'Gilroy-Bold',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: pH*0.034),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/payment.svg',
                                      width: pW*0.088,
                                      height:pH*0.0415,
                                    ),
                                    SizedBox(width: pW*0.05,),
                                    Text(
                                      'Payment',
                                      style: TextStyle(
                                        color: Color(0xFFCBD5E1),
                                        fontSize: 20,
                                        fontFamily: 'Gilroy-Bold',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: pH*0.034),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/telegram.svg',
                                      width: pW*0.088,
                                      height:pH*0.0415,
                                    ),
                                    SizedBox(width: pW*0.05,),
                                    Text(
                                      'Tell Your Friends',
                                      style: TextStyle(
                                        color: Color(0xFFCBD5E1),
                                        fontSize: 20,
                                        fontFamily: 'Gilroy-Bold',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
    );
  }
}
