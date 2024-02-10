import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sms_postman/Services/Colors.dart';
import 'package:sms_postman/Services/ConstantFile.dart';

import 'Loading.dart';

class DNT extends StatefulWidget {
  const DNT({super.key});

  @override
  State<DNT> createState() => _DNTState();
}

class _DNTState extends State<DNT> {
  Widget build(BuildContext context) {
    double pW = MediaQuery.of(context).size.width;
    double pH = MediaQuery.of(context).size.height;
    bool load = false;
    return (load)
        ? Loading()
        : FutureBuilder(
                future:fetchMarketStatus(),
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
                                iconTheme: IconThemeData(color: Colors.white),
                                centerTitle: false,
                                title: Text(
                                  'Deposits and Transfers',
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
