import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_spoon_app/controllers/ThemeController/theme_manager.dart';
import 'package:smart_spoon_app/views/screens/add_device_screen.dart';

class MainScreen extends StatelessWidget {
  static String name = "/mainScreen";
  MainScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ThemeManager _themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value:
                      _themeManager.themeMode == ThemeMode.light ? false : true,
                  onChanged: (newValue) => {
                    _themeManager.toggleTheme(newValue),
                  },
                ),
                ElevatedButton(
                  onPressed: () =>
                      {Navigator.of(context).pushNamed(AddDeviceScreen.name)},
                  child: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
