import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_postman/Pages/Portfolio.dart';
import '../Services/Colors.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui';

class Crypto extends StatefulWidget {
  const Crypto({super.key});

  @override
  State<Crypto> createState() => _CryptoState();
}

class _CryptoState extends State<Crypto> {

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
                centerTitle: false,
                title: Text(
                  'Crypto',
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
                    padding: EdgeInsets.only(left: pH*0.02),
                    width: pW*0.5,
                    child: Text(
                      'Trending Crypto',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'CircularSpotifyTxT-Bold',
                      ),
                    ),
                  ),
                  Container(
                    // color: MyColors.color11,
                    child: Image.asset(
                      'assets/ethereum.png',
                      // color: MyColors.color11,
                    ),
                  ),
                  SizedBox(height: pH*0.011,),
                  Container(
                    padding: EdgeInsets.only(left: pH*0.02),
                    width: pW*0.5,
                    child: Text(
                      'Market Statistics',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'CircularSpotifyTxT-Bold',
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
