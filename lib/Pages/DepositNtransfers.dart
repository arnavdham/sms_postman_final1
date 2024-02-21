import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sms_postman/Pages/Account.dart';
import 'package:sms_postman/Services/Colors.dart';
import 'package:sms_postman/Services/UserFile.dart';
import 'package:sms_postman/Services/StocksFile.dart';
import 'package:sms_postman/models/MarketStatusModel.dart';
import 'Loading.dart';
import 'package:sms_postman/Pages/drawer_screen.dart';

class DNT extends StatefulWidget {
  const DNT({super.key});

  @override
  State<DNT> createState() => _DNTState();
}

class _DNTState extends State<DNT> {
  Widget build(BuildContext context) {
    double pW = MediaQuery.of(context).size.width;
    double pH = MediaQuery.of(context).size.height;
    return FutureBuilder(
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
                                leading: IconButton(
                                  icon: Icon(Icons.arrow_back),
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => AccountPage()),
                                    // );
                                  },
                                ),
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
                            // SizedBox(height: pH*0.1,),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(height: pH*0.1,),
                                    Container(
                                      color: Colors.transparent,
                                      height: pH*0.83,
                                      child: ListView.builder(
                                        itemCount: globalBuyOrders!.length,
                                          itemBuilder:(context,index){
                                            BuyOrders buyOrder = globalBuyOrders![index];
                                            String stocknamed='';
                                            for(int j=0;j<stocksd.length;j++){
                                              if(buyOrder.stock==stocksd[j].id){
                                                stocknamed=stocksd[j].name.toString();
                                                // print(stocknamed);
                                              }
                                            }
                                          return Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(16),
                                                height: pH*0.15,
                                                width: pW,
                                                decoration: BoxDecoration(
                                                  color: MyColors.color11,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Stock Name: ${stocknamed.toString()}',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontFamily: 'CircularSpotifyTxT-Bold',
                                                      ),
                                                    ),
                                                    Text(
                                                        'Total Price: ${buyOrder.price!* (buyOrder.quantity as int)}',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontFamily: 'CircularSpotifyTxT-Bold',
                                                      ),
                                                    ),
                                                    Text(
                                                        'Quantity: ${buyOrder.quantity}',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontFamily: 'CircularSpotifyTxT-Bold',
                                                      ),
                                                    ),
                                                    Text(
                                                        'isConfirmed: ${buyOrder.isComplete}',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontFamily: 'CircularSpotifyTxT-Bold',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: pH*0.02,),
                                            ],
                                          );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                }
            );
  }
}
