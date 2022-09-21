import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_spoon_app/controllers/ThemeController/theme_constants.dart';
import 'package:smart_spoon_app/views/screens/add_device_screen.dart';
import 'package:smart_spoon_app/views/widgets/main_screen_widgets/device_container_widget.dart';

import '../../controllers/ThemeController/theme_manager.dart';
import '../widgets/main_screen_widgets/app_bar_widget.dart';

class MainScreen extends StatelessWidget {
  static String name = "/mainScreen";
  MainScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _drawer(ThemeManager _themeManager, BuildContext ctx) {
    return Drawer(
      backgroundColor: COLOR_PRIMARY,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: const EdgeInsets.all(0),
            child: Text(
              'Settings',
              style: TextStyle(
                color: _themeManager.themeMode == ThemeMode.light
                    ? COLOR_PRIMARY_DARK
                    : COLOR_PRIMARY,
                fontWeight: FontWeight.w700,
                fontSize: 32,
                overflow: TextOverflow.visible,
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(ctx).canvasColor,
            ),
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
            onTap: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
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
      drawer: _drawer(_themeManager, context),
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => {
          Navigator.of(context).pushNamed(AddDeviceScreen.name),
        },
        child: const Icon(
          Icons.add,
          color: COLOR_PRIMARY_DARK,
        ),
      ),
    );
  }
}
