import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_spoon_app/controllers/ThemeController/theme_constants.dart';
import 'package:smart_spoon_app/views/home_screen/home_screen_widgets/device_container_widget.dart';

import '../../controllers/ThemeController/theme_manager.dart';
import 'home_screen_widgets/app_bar_widget.dart';
import 'home_screen_widgets/nav_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  static String name = "/homeScreen";
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _drawer(ThemeManager _themeManager, BuildContext ctx, Size size) {
    return Drawer(
      backgroundColor: COLOR_PRIMARY,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.only(top: size.height * 0.1),
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                'Settings',
                style: TextStyle(
                    color: COLOR_PRIMARY_DARK, fontSize: size.width * 0.12),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(ctx).primaryColor,
            ),
          ),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(
                color: COLOR_PRIMARY_DARK,
                fontWeight: FontWeight.w700,
                fontSize: 20,
                overflow: TextOverflow.visible,
              ),
            ),
            trailing: const Icon(
              Icons.home_outlined,
              size: 40,
              color: COLOR_PRIMARY_DARK,
            ),
            onTap: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
          ListTile(
            title: const Text(
              'Dark Mode',
              style: TextStyle(
                color: COLOR_PRIMARY_DARK,
                fontWeight: FontWeight.w700,
                fontSize: 20,
                overflow: TextOverflow.visible,
              ),
            ),
            trailing: Switch(
              value: _themeManager.themeMode == ThemeMode.light ? false : true,
              onChanged: (newValue) => {
                _themeManager.toggleTheme(newValue),
              },
              activeColor: COLOR_ACCENT,
            ),
          ),
          ListTile(
            title: const Text(
              'Exit',
              style: TextStyle(
                color: COLOR_PRIMARY_DARK,
                fontWeight: FontWeight.w700,
                fontSize: 20,
                overflow: TextOverflow.visible,
              ),
            ),
            trailing: const Icon(
              Icons.exit_to_app_rounded,
              size: 40,
              color: COLOR_PRIMARY_DARK,
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeManager _themeManager = Provider.of<ThemeManager>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: _drawer(_themeManager, context, size),
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
