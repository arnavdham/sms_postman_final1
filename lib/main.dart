import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sms_postman/Pages/drawer_screen.dart';
import 'package:sms_postman/Services/Colors.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sms_postman/Services/AccessTokensFunctions.dart';

import 'Services/ConstantFile.dart';

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
          splashColor: Colors.transparent,
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
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0,16.0, 8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: pH * 0.1,
                  ),
                  Container(
                    width: pW*0.74,
                    child: Text(
                      'Welcome To',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'Gilroy-Medium',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    width: pW*0.74,
                    child: Text(
                      'SMS!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'Gilroy-Medium',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: pH*0.025,),
                  Container(
                    width: pW*0.74,
                    child: Text(
                      'Unleash Your Potential: Sign up and Trade with Confidence',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w200,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: pH*0.15,),
                  Column(
                    children: [
                      TextButton(
                        onPressed: googleLogin,
                        child: Container(
                          width: pW*0.75,
                          height: pH*0.075,
                          decoration: ShapeDecoration(
                            color: Color(0xFF2D1450),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFF5B1BA9)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed:googleLogin,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFF5B1BA9),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
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
    );
  }
}