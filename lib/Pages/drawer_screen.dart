import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sms_postman/Pages/home_wrapper.dart';
import '../Services/Colors.dart';
import '../Services/Navbar.dart';
import 'home.dart';
// import 'package:sms_postman/navbar.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DraweScreenState();
}

class _DraweScreenState extends State<DrawerScreen> {
  final zoomDrawerController=ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      mainScreenTapClose: true,
      menuBackgroundColor: MyColors.color11,
      angle: 0.0,
      menuScreenWidth: MediaQuery.of(context).size.width*2/3,
      controller: zoomDrawerController,
      menuScreen: Navbar(),
      mainScreen: HomeWrapper(),
    );
  }
}
