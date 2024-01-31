import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sms_postman/Services/CandleChart.dart';
import 'package:sms_postman/Services/Colors.dart';
import 'dart:ui';
import 'package:sms_postman/Services/ConstantFile.dart';

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
    return Card(
      color: MyColors.color2,
      margin: EdgeInsets.all(8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: MyColors.color1,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Image.network(
            imageUrl != null && imageUrl.isNotEmpty
                ? imageUrl
                : 'fallback_image_url.png', // Provide a fallback image
            width: 80,
            height: 80,
          ),
          Text(name),
          Text(price),
          Text(
            change,
            style: TextStyle(
              color: change.startsWith('+') ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
class Portfolio extends StatefulWidget {
  const Portfolio({super.key});
  @override
  State<Portfolio> createState() => _PortfolioState();
}
class _PortfolioState extends State<Portfolio> {
  @override
  void initState() {
    super.initState();
    fetchStocks();
  }
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
              body: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
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
                            'Portfolio',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontFamily: 'CircularSpotifyTxT-Bold',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Container(
                                  height:pH*0.120,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [MyColors.color20, MyColors.color19],
                                      stops: [0.3, 1.0], // 30% of the gradient is color20, 70% is color19
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Total Balance',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontFamily: 'CircularSpotifyTxT-Bold',
                                              ),
                                            ),
                                            SizedBox(height:pH*0.0056),
                                            Text(
                                              '\$ ${userdatbject!.balance.toString()}',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontFamily: 'CircularSpotifyTxT-Bold',
                                              ),
                                            ),
                                            // SizedBox(height: 16),
                                          ],
                                        ),
                                        Container(
                                          child: ClipOval(
                                            child: Row(
                                              children: [
                                                SvgPicture.asset('assets/prof.svg'),
                                                SizedBox(width: pW * 0.005),
                                                Text(
                                                  '0 %',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily: 'Gilroy-Medium',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color: MyColors.color24,
                                            borderRadius: BorderRadius.circular(10.0), // Set your desired border radius
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: pH*0.11,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                    color: MyColors.color2,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(16,16,16,16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              // textAlign: TextAlign.left,
                                              'Profit',
                                              style: TextStyle(color: Colors.green,fontFamily: 'CircularSpotifyTxT-Bold',),
                                            ),
                                            SizedBox(
                                              height: pH*0.0056,
                                            ),
                                            Text(
                                              // textAlign: TextAlign.left,
                                              '\$13250.00',
                                              style: TextStyle(color: Colors.white,fontFamily: 'CircularSpotifyTxT-Bold',),
                                            ),
                                          ],
                                        ),
                                        Row(
                                            children:[
                                              SvgPicture.asset('assets/prof.svg'),
                                              SizedBox(width: pW*0.005,),
                                              Text(
                                                '0 %',
                                                style:TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontFamily: 'Gilroy-Medium',
                                                ),
                                              ),
                                            ]
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16,0,16,0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'My Stocks',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'CircularSpotifyTxT-Bold',
                                    ),
                                  ),
                                  IconButton(
                                    icon: SvgPicture.asset('assets/shorts.svg'),
                                    onPressed: () {
                                    },
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                                      splashFactory: NoSplash.splashFactory,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: pH*0.47,
                                // padding: EdgeInsets.fromLTRB(16,0,16,0),
                                child: ListView.builder(
                                  itemCount: stocksd.length,
                                  itemBuilder: (context, index) {
                                    final imageUrl = '/* Stock image URL */';
                                    final stockName = stocksd[index].name.toString();
                                    final currentPrice = stocksd[index].price.toString();
                                    final change = 'Rs 134.25';
                                    final shares='${stocksd[index].quantity.toString()} shares';

                                    return ExpandableCard(
                                      imageUrl: imageUrl,
                                      stockName: stockName,
                                      currentPrice: currentPrice,
                                      change: change,
                                      shares:shares,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // Positioned(
                  //   top:pH*0.1,
                  //   left:0,
                  //   right:0,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(16.0),
                  //     child: Container(
                  //       width: double.infinity,
                  //       child: Column(
                  //         children: [
                  //           Container(
                  //             height:pH*0.120,
                  //             width: double.infinity,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.only(
                  //                 topLeft: Radius.circular(20.0),
                  //                 topRight: Radius.circular(20.0),
                  //                 bottomLeft: Radius.circular(0.0),
                  //                 bottomRight: Radius.circular(0.0),
                  //               ),
                  //               gradient: LinearGradient(
                  //                 begin: Alignment.topRight,
                  //                 end: Alignment.bottomLeft,
                  //                 colors: [MyColors.color20, MyColors.color19],
                  //                 stops: [0.3, 1.0], // 30% of the gradient is color20, 70% is color19
                  //               ),
                  //             ),
                  //             child: Padding(
                  //               padding: EdgeInsets.all(16.0),
                  //               child: Row(
                  //                 children: [
                  //                   Column(
                  //                     // crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         'Total Balance',
                  //                         style: TextStyle(
                  //                           fontSize: 15,
                  //                           color: Colors.white,
                  //                           fontFamily: 'CircularSpotifyTxT-Bold',
                  //                         ),
                  //                       ),
                  //                       SizedBox(height:pH*0.0056),
                  //                       Text(
                  //                         '\$ ${userdatbject!.balance.toString()}',
                  //                         style: TextStyle(
                  //                           fontSize: 20,
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Colors.white,
                  //                           fontFamily: 'CircularSpotifyTxT-Bold',
                  //                         ),
                  //                       ),
                  //                       // SizedBox(height: 16),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //           Container(
                  //             height: pH*0.11,
                  //             width: double.infinity,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.only(
                  //                 topLeft: Radius.circular(0.0),
                  //                 topRight: Radius.circular(0.0),
                  //                 bottomLeft: Radius.circular(20.0),
                  //                 bottomRight: Radius.circular(20.0),
                  //               ),
                  //               color: MyColors.color2,
                  //             ),
                  //             child: Padding(
                  //               padding: EdgeInsets.fromLTRB(16,16,16,16.0),
                  //               child: Row(
                  //                 children: [
                  //                   Column(
                  //                     // mainAxisAlignment: MainAxisAlignment.start,
                  //                     // crossAxisAlignment: CrossAxisAlignment.stretch,
                  //                     children: [
                  //                       Text(
                  //                         // textAlign: TextAlign.left,
                  //                         'Profit',
                  //                         style: TextStyle(color: Colors.green,fontFamily: 'CircularSpotifyTxT-Bold',),
                  //                       ),
                  //                       SizedBox(
                  //                         height: pH*0.0056,
                  //                       ),
                  //                       Text(
                  //                         // textAlign: TextAlign.left,
                  //                         '\$13250.00',
                  //                         style: TextStyle(color: Colors.white,fontFamily: 'CircularSpotifyTxT-Bold',),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   top:pH*0.38,
                  //   left:0,
                  //   right:0,
                  //   child: Padding(
                  //     padding: EdgeInsets.fromLTRB(16,0,16,0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               'My Stocks',
                  //               style: TextStyle(
                  //                 fontSize: 15,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.white,
                  //                 fontFamily: 'CircularSpotifyTxT-Bold',
                  //               ),
                  //             ),
                  //             IconButton(
                  //               icon: SvgPicture.asset('assets/shorts.svg'),
                  //               onPressed: () {
                  //               },
                  //               style: ButtonStyle(
                  //                 overlayColor: MaterialStateProperty.all(Colors.transparent),
                  //                 splashFactory: NoSplash.splashFactory,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Container(
                  //           height: pH*0.47,
                  //           // padding: EdgeInsets.fromLTRB(16,0,16,0),
                  //           child: ListView.builder(
                  //             itemCount: stocksd.length,
                  //             itemBuilder: (context, index) {
                  //               final imageUrl = '/* Stock image URL */';
                  //               final stockName = stocksd[index].name.toString();
                  //               final currentPrice = stocksd[index].price.toString();
                  //               final change = 'Rs 134.25';
                  //               final shares='${stocksd[index].quantity.toString()} shares';
                  //
                  //               return ExpandableCard(
                  //                 imageUrl: imageUrl,
                  //                 stockName: stockName,
                  //                 currentPrice: currentPrice,
                  //                 change: change,
                  //                 shares:shares,
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   )
                  // ),
                ],
              ),
            );
          }
        }
    );
  }
}

class ExpandableCard extends StatefulWidget {
  final String imageUrl;
  final String stockName;
  final String currentPrice;
  final String change;
  final String shares;

  ExpandableCard({
    required this.imageUrl,
    required this.stockName,
    required this.currentPrice,
    required this.change,
    required this.shares,
  });

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.color2,
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Container(
          height: MediaQuery.of(context).size.height*0.09,
          child: ListTile(
            splashColor: Colors.transparent,
            tileColor: Colors.transparent,
            selectedTileColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpandableCardView(
                    imageUrl: widget.imageUrl,
                    stockName: widget.stockName,
                    currentPrice: widget.currentPrice,
                    change: widget.change,
                  ),
                ),
              );
            },
            leading: null,
            trailing: null,
            title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width:MediaQuery.of(context).size.width*0.21,
                  child: Column(
                    children: [
                      Text(
                        widget.stockName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.shares,
                          style: TextStyle(
                            color: MyColors.color23,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/shareloss.png'),
                Container(
                  width:MediaQuery.of(context).size.width*0.25,
                  child: Column(
                    children: [
                      Text(
                        widget.currentPrice,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        widget.change,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ExpandableCardView extends StatefulWidget {
  final String imageUrl;
  final String stockName;
  final String currentPrice;
  final String change;
  ExpandableCardView({required this.imageUrl,
    required this.stockName,
    required this.currentPrice,
    required this.change,});

  @override
  State<ExpandableCardView> createState() => _ExpandableCardViewState();
}

class _ExpandableCardViewState extends State<ExpandableCardView> {
  bool isStarPressed = false;
  @override
  Widget build(BuildContext context) {
    double pW = MediaQuery.of(context).size.width;
    double pH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Container(
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
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  widget.stockName,
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                    icon: Icon(!isStarPressed ? Icons.star_border : Icons.star),
                    onPressed: () {
                      setState(() {
                        isStarPressed = !isStarPressed;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0,8.0,8.0,8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: pH * 0.1,
                  ),
                  CandleChart(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RowContainer(title: 'Daily Change', value: 'Value 1'),
                          RowContainer(title: 'Highest Price', value: 'Value 2'),
                          RowContainer(title: 'Lowest Price', value: 'Value 3'),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  elevation: MaterialStatePropertyAll<double?>(5.0),
                                  backgroundColor:
                                  MaterialStatePropertyAll<Color>(Color(0xFFFB8B88)),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ))),
                              child: Text(
                                'Sell',
                                style: TextStyle(color: Color(0xff841C22)),
                              )),
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: MaterialStatePropertyAll<double?>(5.0),
                                backgroundColor:
                                MaterialStatePropertyAll<Color>(Color(0xFF99CA73)),
                                shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Buy',
                                style: TextStyle(color: Color(0xFF37592F)),
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       SizedBox(height: 20,),
      //       CandleChart(),
      //       SizedBox(height: 20,),
      //
      //     ],
      //   ),
      // ),
    );
  }
}

class RowContainer extends StatelessWidget {
  final String title;
  final String value;

  RowContainer({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8.0),
          Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xffC2D885)),
          ),
        ],
      ),
    );
  }
}