import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_spoon_app/controllers/ThemeController/theme_manager.dart';
import 'package:smart_spoon_app/views/screens/add_device_screen.dart';
import 'package:smart_spoon_app/views/widgets/main_screen_widgets/app_bar_widget.dart';
import 'package:smart_spoon_app/views/widgets/main_screen_widgets/device_container_widget.dart';

class MainScreen extends StatelessWidget {
  static String name = "/mainScreen";
  MainScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ThemeManager _themeManager = Provider.of<ThemeManager>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomAppBarWidget(width: size.width, height: size.height),
          DeviceContainer(width: size.width, height: size.height)
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
