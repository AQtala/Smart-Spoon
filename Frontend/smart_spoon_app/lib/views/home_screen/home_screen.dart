import 'package:flutter/material.dart';
import 'package:smart_spoon_app/views/home_screen/home_screen_widgets/device_container_widget.dart';

import 'home_screen_widgets/app_bar_widget.dart';
import 'home_screen_widgets/custom_drawer.dart';
import 'home_screen_widgets/nav_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  static String name = "/homeScreen";
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        scaffoldKey: _scaffoldKey,
        size: size,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomAppBarWidget(
            width: size.width,
            height: size.height,
            scaffoldKey: _scaffoldKey,
          ),
          DeviceContainer(
            width: size.width,
            height: size.height,
          ),
          CustomNavBarWidget(
            width: size.width,
            height: size.height,
          ),
        ],
      ),
    );
  }
}
