import 'package:flutter/material.dart';
import 'package:sms_postman/Pages/News.dart';
import 'package:sms_postman/Pages/Portfolio.dart';
import 'package:sms_postman/Services/Colors.dart';
import 'package:sms_postman/Pages/Leaderboard.dart';
import 'package:sms_postman/Pages/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    print(activePage);
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: Footer(),
        body: getPage()
    );
  }

  Widget getPage() {
    return IndexedStack(
      index: activePage,
      children: <Widget>[Home(), Portfolio(), News(), Leaderboard()],
    );
  }

  Widget Footer() {
    List items = [
      'assets/home1.svg',
      'assets/portfolio1.svg',
      'assets/news.svg',
      'assets/leader.svg',
    ];
    List titles = ['Home', 'Portfolio', 'News', 'Leaderboard'];
    return Container(
      color: MyColors.color17,
      height: MediaQuery.of(context).size.height*0.082,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(items.length, (index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        activePage = index;
                      });
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      splashFactory: NoSplash.splashFactory,
                    ),
                    icon: SvgPicture.asset(
                      items[index],
                      color: activePage == index ? MyColors.color18 : Colors.white,
                      width: MediaQuery.of(context).size.width*0.058,
                      height: MediaQuery.of(context).size.height*0.0293,
                    ),
                  ),
                  Text(
                    titles[index],
                    style: TextStyle(
                      color: activePage == index ? MyColors.color18 : Colors.white,
                      fontSize: 10,
                      height:0.2,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

}