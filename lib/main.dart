import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sms_postman/Pages/Loading.dart';
import 'package:sms_postman/Pages/drawer_screen.dart';
import 'package:sms_postman/Services/Colors.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:sms_postman/Services/ConstantFile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:sms_postman/Services/AccessTokensFunctions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: MyColors.color11),
          useMaterial3: true,
        ),
        home: const DrawerScreens(),
      );
    });
  }
}

class DrawerScreens extends StatefulWidget {
  const DrawerScreens({Key? key}) : super(key: key);

  @override
  State<DrawerScreens> createState() => _DrawerScreensState();
}

class _DrawerScreensState extends State<DrawerScreens> {
  String responseData = '';
  bool sign = false;

  googleLogin() async {
    print("Login method called.");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final result = await _googleSignIn.signIn();
      final token = await result?.authentication;
      await saveAccessToken(token?.accessToken ?? '');
      final response = await http.post(
        Uri.parse('https://smsapp.bits-postman-lab.in/auth/google/login'),
        body: json.encode({
          'accessToken': token?.accessToken,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      final actok = await getAccessToken();
      print(actok);
      if(actok != null){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DrawerScreen()),
        );
      }
      else{
        print("Not logged in!");
      }
    } catch (error) {
      print(error);
    }
  }

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
                centerTitle: false,
                title: Text(
                  'Stock Market Simulation',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontFamily: 'CircularSpotifyTxT-Bold',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: pH * 0.1,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: googleLogin,
                      child: Text('Sign In'),
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