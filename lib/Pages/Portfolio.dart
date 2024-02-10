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
    fetchMarketStatus();
    Trendingstks();
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                              'Rs ${userdatbject!.balance.toString()}.00',
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
                                          child: Row(
                                            children: [
                                              SvgPicture.asset('assets/prof.svg'),
                                              SizedBox(width: pW * 0.005),
                                              Text(
                                                '${balpercent.toStringAsFixed(2)}%',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontFamily: 'Gilroy-Medium',
                                                ),
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            // color: MyColors.color24,
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // textAlign: TextAlign.left,
                                              profits>=0 ? 'Total Profit' : 'Total Loss',
                                              style: profits>=0 ? TextStyle(color: Colors.green, fontFamily: 'CircularSpotifyTxT-Bold') : TextStyle(color: Colors.red, fontFamily: 'Arial'),
                                            ),
                                            SizedBox(
                                              height: pH*0.0056,
                                            ),
                                            Text(
                                              // textAlign: TextAlign.left,
                                              'Rs ${profits.abs().toStringAsFixed(2)}',
                                              style: TextStyle(color: Colors.white,fontFamily: 'CircularSpotifyTxT-Bold',),
                                            ),
                                          ],
                                        ),
                                        Row(
                                            children:[
                                              SvgPicture.asset('assets/prof.svg'),
                                              SizedBox(width: pW*0.005,),
                                              Text(
                                                '${percent.toStringAsFixed(2)}%',
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
                                    final id=stocksd[index].id.toString();
                                    return ExpandableCard(
                                      imageUrl: imageUrl,
                                      stockName: stockName,
                                      currentPrice: currentPrice,
                                      change: change,
                                      shares:shares,
                                      id:id,
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
  final String id;
  ExpandableCard({
    required this.imageUrl,
    required this.stockName,
    required this.currentPrice,
    required this.change,
    required this.shares,
    required this.id,
  });

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  @override
  Widget build(BuildContext context) {
    double pW=MediaQuery.of(context).size.width;
    double pH=MediaQuery.of(context).size.height;
    return Card(
      color: MyColors.color2,
      child: Container(
        // clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.fromLTRB(pW*0.032,pH*0.015 , pW*0.032, 0 ),
        height: widget.stockName.length>12 ?MediaQuery.of(context).size.height*0.115:MediaQuery.of(context).size.height*0.09,
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
                builder: (context) => ExpandableView(
                  imageUrl: widget.imageUrl,
                  stockName: widget.stockName,
                  currentPrice: widget.currentPrice,
                  change: widget.change,
                  id:widget.id,
                  shares:widget.shares,
                ),
              ),
            );
          },
          // leading: null,
          // trailing: null,
          // title:Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       width:MediaQuery.of(context).size.width*0.21,
          //       child: Column(
          //         children: [
          //           Align(
          //             alignment: Alignment.topLeft,
          //             child: Text(
          //               widget.stockName,
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 15,
          //               ),
          //             ),
          //           ),
          //           Align(
          //             alignment: Alignment.topLeft,
          //             child: Text(
          //               widget.shares,
          //               style: TextStyle(
          //                 color: MyColors.color23,
          //                 fontSize: 13,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       width: MediaQuery.of(context).size.width*0.2,
          //       height: MediaQuery.of(context).size.width*0.1,
          //       child: Image.asset(
          //           'assets/shareloss.png',
          //       ),
          //     ),
          //     Container(
          //       width:MediaQuery.of(context).size.width*0.25,
          //       child: Column(
          //         children: [
          //           Align(
          //             alignment:Alignment.topLeft,
          //             child: Text(
          //               widget.currentPrice as String,
          //               style: TextStyle(
          //                 fontSize: 15,
          //                 color: Colors.red,
          //               ),
          //             ),
          //           ),
          //           Align(
          //             alignment:Alignment.topLeft,
          //             child: Text(
          //               widget.change,
          //               style: TextStyle(
          //                 fontSize: 12,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          leading:Container(
            width: pW*0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.stockName,
                  style: TextStyle(
                    color: Color(0xFFF5F5F5),
                    fontSize: 13,
                    fontFamily: 'Gilroy-Medium',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.shares,
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 8,
                    fontFamily: 'Gilroy-Medium',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ExpandableView extends StatefulWidget {
  final String imageUrl;
  final String stockName;
  final String currentPrice;
  final String change;
  final String id;
  final String shares;
  ExpandableView({
    required this.imageUrl,
    required this.stockName,
    required this.currentPrice,
    required this.change,
    required this.id,
    required this.shares,
  });

  @override
  State<ExpandableView> createState() => _ExpandableViewState();
}

class _ExpandableViewState extends State<ExpandableView> {
  bool isStarPressed = false;
  final TextEditingController _Controller = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  int totalPrice=0;

  // //void updateTotalPrice() {
  //   // Update total price based on quantity and current price
  //   setState(() {
  //     int quantity = int.tryParse(_Controller.text) ?? 0;
  //     totalPrice = int.parse(widget.currentPrice) * quantity;
  //   });
  // }
  void _showBuyDialog() {
    TextEditingController _quantityController = TextEditingController();
    int totalPrice = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('${widget.stockName}  - ${widget.currentPrice}'),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  children: [
                    TextField(
                      controller: _quantityController,
                      decoration: InputDecoration(labelText: 'Quantity'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            int inputValue = int.parse(value);
                            totalPrice = inputValue * int.parse(widget.currentPrice);
                          } else {
                            totalPrice = 0;
                          }
                        });
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Row(
                      children: [
                        Text('Total price : '),
                        Text(totalPrice.toString()),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Cancel'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: TextButton(
                    onPressed: () {
                      int quantity = int.tryParse(_quantityController.text) ?? 0;
                      // sendMarketBuy(widget.id, quantity, int.parse(widget.currentPrice));
                      sendIPOBuy(widget.id, quantity);
                      _quantityController.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text('Buy'),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showSellDialog() {
    TextEditingController _quantityController = TextEditingController();
    int totalPrice = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('${widget.stockName}  - ${widget.currentPrice}'),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  children: [
                    TextField(
                      controller: _quantityController,
                      decoration: InputDecoration(labelText: 'Quantity'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            int inputValue = int.parse(value);
                            totalPrice = inputValue * int.parse(widget.currentPrice);
                          } else {
                            totalPrice = 0;
                          }
                        });
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Row(
                      children: [
                        Text('Total price : '),
                        Text(totalPrice.toString()),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Cancel'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: TextButton(
                    onPressed: () {
                      int quantity = int.tryParse(_quantityController.text) ?? 0;
                      sellMarket(widget.id, quantity, int.parse(widget.currentPrice));
                      _quantityController.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text('Sell'),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    double pW = MediaQuery.of(context).size.width;
    double pH = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  // widget.stockName,
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
                              onPressed: () {
                                _showSellDialog();
                              },
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
                              onPressed: () {
                                _showBuyDialog();
                                // sendMarketBuy(widget.id, 5,10);
                                // print(widget.id);
                                // print(widget.currentPrice);
                                // print(widget.shares);
                                // sellMarket(widget.id,1, 10);
                              },
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