import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sms_postman/Services/CandleChart.dart';
import 'package:sms_postman/Services/Colors.dart';
import 'dart:ui';
import 'package:sms_postman/Services/ConstantFile.dart';

class Stocks extends StatefulWidget {
  const Stocks({super.key});
  @override
  State<Stocks> createState() => _StocksState();
}
class _StocksState extends State<Stocks> {
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
        future:updateValues(),
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
                          iconTheme: IconThemeData(color:Colors.white),
                          centerTitle: false,
                          title: Text(
                            'Explore Stocks',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontFamily: 'CircularSpotifyTxT-Bold',
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
                                    'Stocks',
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
                                height: pH*0.8,
                                // color: Colors.orange,
                                // padding: EdgeInsets.fromLTRB(0,0,0,0),
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
          leading:Container(
            width: pW*0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
          title:Container(
            width: MediaQuery.of(context).size.width*0.2,
            height: MediaQuery.of(context).size.width*0.1,
            child: Image.asset(
              'assets/shareloss.png',
            ),
          ),
          trailing: Container(
            width: pW*0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.currentPrice as String,
                  style: TextStyle(
                    fontSize: 13,
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
  void _showIPOBuyDialog() {
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
                    Navigator.of(context).pop();
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
                    Navigator.of(context).pop();
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
                      sendMarketBuy(widget.id, quantity, int.parse(widget.currentPrice));
                      // sendIPOBuy(widget.id, quantity);
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
                                _showIPOBuyDialog();
                              },
                              style: ButtonStyle(
                                  elevation: MaterialStatePropertyAll<double?>(5.0),
                                  backgroundColor:
                                  MaterialStatePropertyAll<Color>(Colors.deepOrange),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ))),
                              child: Text(
                                'IPO BUY',
                                style: TextStyle(color: Colors.orange,
                                ),
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