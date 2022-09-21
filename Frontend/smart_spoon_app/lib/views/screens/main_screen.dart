import 'package:flutter/material.dart';
import 'package:smart_spoon_app/controllers/ThemeController/theme_constants.dart';
import 'package:smart_spoon_app/views/screens/add_device_screen.dart';
import 'package:smart_spoon_app/views/widgets/main_screen_widgets/device_container_widget.dart';

import '../widgets/main_screen_widgets/app_bar_widget.dart';

class MainScreen extends StatelessWidget {
  static String name = "/mainScreen";
  MainScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: COLOR_PRIMARY,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: COLOR_ACCENT,
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
            )
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomAppBarWidget(
            width: size.width,
            height: size.height,
            scaffoldKey: _scaffoldKey,
          ),
          DeviceContainer(width: size.width, height: size.height),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => {
          Navigator.of(context).pushNamed(AddDeviceScreen.name),
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
