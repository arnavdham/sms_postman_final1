import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sms_postman/Services/ConstantFile.dart';
import 'Colors.dart';
import 'package:http/http.dart' as http;
class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
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
            backgroundColor: MyColors.color11,
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: pH*0.04,),
                        Row(
                          children: [
                            SizedBox(width: pW*0.08,),
                            Container(
                              width: pW * 0.096,
                              height: pH * 0.048,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyColors.color18, // Replace with your desired border color
                                  width: 2.0, // Adjust the width as needed
                                ),
                                shape: BoxShape.circle, // This makes the container circular
                              ),
                              child: ClipOval(
                                child: Container(
                                  width: pW * 0.096,
                                  height: pH * 0.048,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(userdatbject!.picture.toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: pW*0.04,),
                            Container(
                              width: pW*0.30,
                              child: Text(
                                userdatbject!.fullName.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Gilroy-Bold',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.068*pH,),
                        Row(
                          children: [
                            SizedBox(width: pW*0.08,),
                            SvgPicture.asset(
                              'assets/account.svg',
                              width: pW*0.066,
                            ),
                            SizedBox(width: pW*0.05,),
                            TextButton(
                              onPressed:(){

                              },
                              child:Text(
                                'Account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Gilroy-Bold',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: pH*0.013,),
                        Align(
                          alignment:Alignment.center,
                          child: Container(
                            width: pW*0.43,
                            child: Divider(
                              color: Color(0xFF515151),
                              thickness: 2,
                            ),
                          ),
                        ),
                        // SizedBox(height: pH*0.013,),
                        // Row(
                        //   children: [
                        //     SizedBox(width: pW*0.08,),
                        //     SvgPicture.asset(
                        //       width: pW*0.066,
                        //       'assets/Deposits.svg',
                        //     ),
                        //     SizedBox(width: pW*0.05,),
                        //     Container(
                        //       width: pW*0.45,
                        //       child: TextButton(
                        //         onPressed:(){
                        //
                        //         },
                        //         child:Text(
                        //           'Deposits & transfers',
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 18,
                        //             fontFamily: 'Gilroy-Bold',
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: pH*0.013,),
                        // Align(
                        //   alignment:Alignment.center,
                        //   child: Container(
                        //     width: pW*0.43,
                        //     child: Divider(
                        //       color: Color(0xFF515151),
                        //       thickness: 2,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: pH*0.013,),
                        // Row(
                        //   children: [
                        //     SizedBox(width: pW*0.08,),
                        //     SvgPicture.asset(
                        //       width: pW*0.066,
                        //       'assets/IPO.svg',
                        //     ),
                        //     SizedBox(width: pW*0.05,),
                        //     TextButton(
                        //       onPressed:(){
                        //
                        //       },
                        //       child:Text(
                        //         'IPO',
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 18,
                        //           fontFamily: 'Gilroy-Bold',
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: pH*0.013,),
                        // Align(
                        //   alignment:Alignment.center,
                        //   child: Container(
                        //     width: pW*0.43,
                        //     child: Divider(
                        //       color: Color(0xFF515151),
                        //       thickness: 2,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: pH*0.013,),
                        Row(
                          children: [
                            SizedBox(width: pW*0.08,),
                            SvgPicture.asset(
                              width: pW*0.066,
                              'assets/Settings.svg',
                            ),
                            SizedBox(width: pW*0.05,),
                            TextButton(
                              onPressed:(){

                              },
                              child:Text(
                                'Settings',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Gilroy-Bold',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: pH*0.013,),
                        Align(
                          alignment:Alignment.center,
                          child: Container(
                            width: pW*0.43,
                            child: Divider(
                              color: Color(0xFF515151),
                              thickness: 2,
                            ),
                          ),
                        ),
                        SizedBox(height: pH*0.013,),
                        Row(
                          children: [
                            SizedBox(width: pW*0.08,),
                            SvgPicture.asset(
                              'assets/Developrs.svg',
                              width: pW*0.066,
                            ),
                            SizedBox(width: pW*0.05,),
                            TextButton(
                              onPressed:(){

                              },
                              child:Text(
                                'Developers',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Gilroy-Bold',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: pH*0.013,),
                        Align(
                          alignment:Alignment.center,
                          child: Container(
                            width: pW*0.43,
                            child: Divider(
                              color: Color(0xFF515151),
                              thickness: 2,
                            ),
                          ),
                        ),
                        SizedBox(height: pH*0.013,),
                        Row(
                          children: [
                            SizedBox(width: pW*0.08,),
                            SvgPicture.asset(
                              'assets/LogOut.svg',
                              width: pW*0.066,
                            ),
                            SizedBox(width: pW*0.05,),
                            TextButton(
                              onPressed:(){

                              },
                              child:Text(
                                'Log Out',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Gilroy-Bold',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: pW*0.044,),
                            SvgPicture.asset(
                              'assets/Terms.svg',
                              width: pW*0.039,
                            ),
                            SizedBox(width: pW*0.027,),
                            TextButton(
                              onPressed:(){

                              },
                              child:Text(
                                'Terms & conditions',
                                style: TextStyle(
                                  color: MyColors.color18,
                                  fontSize: 12,
                                  fontFamily: 'Gilroy-Bold',
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: pH*0.022,),
                        Row(
                          children: [
                            SizedBox(width: pW*0.044,),
                            SvgPicture.asset(
                              'assets/Terms.svg',
                              width: pW*0.039,
                            ),
                            SizedBox(width: pW*0.027,),
                            TextButton(
                              onPressed:(){

                              },
                              child:Text(
                                'Disclaimer',
                                style: TextStyle(
                                  color: MyColors.color18,
                                  fontSize: 12,
                                  fontFamily: 'Gilroy-Bold',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: pH*0.021,),
                ],
              ),
            ),
          );
        }
      }
    );
  }
}
