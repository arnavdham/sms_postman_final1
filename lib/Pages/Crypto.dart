import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'Loading.dart';
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
    bool load = false;
    return (load)
        ? Loading()
        : Scaffold(
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
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: pH * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trending Crypto',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Container(
                              height: pH * 0.2,
                              width: pW * 0.41,
                              child: CryptoCard(
                                imagePath: 'assets/ethereum.png',
                                name: 'Etherium',
                                price: '13.99',
                              ),
                            ),
                            SizedBox(width: 16),
                            Container(
                              height: pH * 0.2,
                              width: pW * 0.41,
                              child: CryptoCard(
                                imagePath: 'assets/ethereum.png',
                                name: 'Bitcoin',
                                price: '1569',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: pH * 0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(width: pW*0.03,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Market Statistics',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'CircularSpotifyTxT-Bold',
                          ),
                        ),
                      ),
                    ],
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
                          width: pW*0.3,
                          height: pH*0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF221E42),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Text('Explore', style: TextStyle(color: Colors.white),)),
                        ),Container(
                          width: pW*0.3,
                          height: pH*0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF221E42),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Text('Top Gainers', style: TextStyle(color: Colors.white),)),
                        ),Container(
                          width: pW*0.3,
                          height: pH*0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF221E42),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Text('Top Losers', style: TextStyle(color: Colors.white),)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: pH * 0.012,
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

class CryptoCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  const CryptoCard({
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color(0xFF221E42),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      imagePath,
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.14,
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff5dc9e1).withOpacity(0.09),
                      ),
                      child: Text(
                        '\$1569',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Image.asset('assets/graphloss.png')
              ],
            ),
            ),
        );
    }
}
