import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sms_postman/Services/LeaderboardFile.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    double pW = MediaQuery.of(context).size.width;
    double pH = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future:fetchLeaderboard(),
      builder: (context,snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/bg.png"),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  AppBar(
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
                      'Leaderboard',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontFamily: 'CircularSpotifyTxT-Bold',
                      ),
                    ),
                  ),
                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding:
                  //       EdgeInsets.symmetric(horizontal: pW*0.05, vertical: pH * 0.05),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Column(
                  //             children: [
                  //               SizedBox(height: pH*0.12),
                  //               Container(
                  //                 decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   border: Border.all(color: MyColors.color10, width: 3),
                  //                 ),
                  //                 child: ClipOval(
                  //                   child: Image(
                  //                     image: NetworkImage(
                  //                       leader[1].picture.toString(),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               SvgPicture.asset(
                  //                 'assets/Frame 430.svg',
                  //                 width: 50,
                  //                 height: 50,
                  //               ),
                  //               SizedBox(
                  //                 height: pH*0.01,
                  //               ),
                  //               Container(
                  //                 padding: EdgeInsets.all(10),
                  //                 child: Column(
                  //                   children: [
                  //                     Container(
                  //                       width:pW*0.2,
                  //                       child: Text(
                  //                         leader[1].fullName.toString(),
                  //                         textAlign: TextAlign.center,
                  //                         style: TextStyle(
                  //                           color: Colors.white,
                  //                           fontSize: 12.40,
                  //                           fontFamily: 'Gilroy-Bold',
                  //                           fontWeight: FontWeight.w400,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     SizedBox(height: pH*0.015,),
                  //                     Text(
                  //                       leader[1].balance.toString(),
                  //                       textAlign: TextAlign.center,
                  //                       style: TextStyle(
                  //                         color: Colors.white,
                  //                         fontSize: 13,
                  //                         fontFamily: 'Gilroy-Regular',
                  //                         fontWeight: FontWeight.w400,
                  //                         height: 0.12,
                  //                       ),
                  //                     )
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           Column(
                  //             children: [
                  //               Container(
                  //                 decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   border: Border.all(color: MyColors.color10, width: 3),
                  //                 ),
                  //                 child: ClipOval(
                  //                   child: Image(
                  //                     image: NetworkImage(
                  //                       leader[0].picture.toString(),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               SvgPicture.asset(
                  //                 'assets/Frame 430 (3).svg',
                  //                 width: 50,
                  //                 height: 50,
                  //               ),
                  //               SizedBox(
                  //                 height: pH*0.01,
                  //               ),
                  //               Container(
                  //                 width: pW*0.2,
                  //                 child: Text(
                  //                   leader[0].fullName.toString(),
                  //                   textAlign: TextAlign.center,
                  //                   style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 12.40,
                  //                     fontFamily: 'Gilroy-Bold',
                  //                     fontWeight: FontWeight.w400,
                  //                   ),
                  //                 ),
                  //               ),
                  //               SizedBox(height: pH*0.015,),
                  //               Text(
                  //                 leader[0].balance.toString(),
                  //                 textAlign: TextAlign.center,
                  //                 style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontSize: 13,
                  //                   fontFamily: 'Gilroy-Regular',
                  //                   fontWeight: FontWeight.w400,
                  //                   height: 0.12,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           Column(
                  //             children: [
                  //               SizedBox(height: pH*0.12),
                  //               Container(
                  //                 decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   border: Border.all(color: MyColors.color10, width: 3),
                  //                 ),
                  //                 child: ClipOval(
                  //                   child: Image(
                  //                     image: NetworkImage(
                  //                       leader[2].picture.toString(),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               SvgPicture.asset(
                  //                 'assets/Frame 430 (2).svg',
                  //                 width: 50,
                  //                 height: 50,
                  //               ),
                  //               SizedBox(
                  //                 height: pH*0.01,
                  //               ),
                  //               Column(
                  //                 children: [
                  //                   Container(
                  //                     width: pW*0.2,
                  //                     child: Text(
                  //                       leader[2].fullName.toString(),
                  //                       textAlign: TextAlign.center,
                  //                       style: TextStyle(
                  //                         color: Colors.white,
                  //                         fontSize: 12.40,
                  //                         fontFamily: 'Gilroy-Bold',
                  //                         fontWeight: FontWeight.w400,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   SizedBox(height: 15.0),
                  //                   Text(
                  //                     leader[2].balance.toString(),
                  //                     textAlign: TextAlign.center,
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 13,
                  //                       fontFamily: 'Gilroy-Regular',
                  //                       fontWeight: FontWeight.w400,
                  //                       height: 0.12,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: SingleChildScrollView(
                  //         physics: BouncingScrollPhysics(),
                  //         child: Column(
                  //           children: leader.sublist(3,10).map((itemData) {
                  //             String rank = itemData.position.toString();
                  //             String text = itemData.fullName.toString();
                  //             String points = itemData.balance.toString();
                  //             String isYOU=itemData.isYou.toString();
                  //             String pictures=itemData.picture.toString();
                  //             return Container(
                  //               margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0.0),
                  //               child: Column(
                  //                 children: [
                  //                   SizedBox(
                  //                     height: pH*0.01,
                  //                   ),
                  //                   Container(
                  //                     decoration: isYOU=="true"
                  //                         ? ShapeDecoration(
                  //                       gradient: LinearGradient(
                  //                         begin: Alignment(1.00, 0.00),
                  //                         end: Alignment(-1, 0),
                  //                         colors: [Color(0xFF8160FF),Color(0xFFFF28DE)],
                  //                       ),
                  //                       shape: RoundedRectangleBorder(
                  //                         borderRadius: BorderRadius.circular(12),
                  //                       ),
                  //                     )
                  //                         : ShapeDecoration(
                  //                       color: Color(0xFF221E42),
                  //                       shape: RoundedRectangleBorder(
                  //                         borderRadius: BorderRadius.circular(12),
                  //                       ),
                  //                     ),
                  //                     height: pH*0.08,
                  //                     width: double.infinity,
                  //                     margin: EdgeInsets.only(left: 0, right: 0),
                  //                     child: ListTile(
                  //                       leading: Text(
                  //                         "$rank",
                  //                         style: TextStyle(
                  //                           color: Colors.white,
                  //                           fontSize: 18,
                  //                           fontFamily: 'Gilroy-Bold',
                  //                           fontWeight: FontWeight.w500,
                  //                         ),
                  //                       ),
                  //                       title: Row(
                  //                         children: [
                  //                           Container(
                  //                             width: pW*0.16,
                  //                             height: pH*0.06,
                  //                             decoration: BoxDecoration(
                  //                               shape: BoxShape.circle,
                  //                               image: DecorationImage(
                  //                                 fit: BoxFit.cover,
                  //                                 image: NetworkImage(pictures.toString()),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           SizedBox(width: pW*0.02),
                  //                           Expanded(
                  //                             child: Row(
                  //                               mainAxisAlignment:
                  //                               MainAxisAlignment.spaceBetween,
                  //                               children: [
                  //                                 Container(
                  //                                   width:pW*0.35,
                  //                                   child: Text(
                  //                                     text,
                  //                                     style: TextStyle(
                  //                                       color: Colors.white,
                  //                                       fontSize: 14.40,
                  //                                       fontFamily: 'Gilroy-Bold',
                  //                                       fontWeight: FontWeight.w500,
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Text(
                  //                                   '$points',
                  //                                   style: TextStyle(
                  //                                     color: Colors.white,
                  //                                     fontSize: 14.40,
                  //                                     fontFamily: 'Gilroy-Regular',
                  //                                     fontWeight: FontWeight.w400,
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             );
                  //           }).toList(),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          );
        }
      }
    );
  }
}