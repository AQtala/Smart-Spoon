import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_spoon_app/controllers/ThemeController/theme_constants.dart';
import 'package:smart_spoon_app/views/screens/add_device_screen.dart';
import 'package:smart_spoon_app/views/screens/main_screen.dart';

import 'controllers/ThemeController/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeManager(),
        ),
      ],
      child: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeMode _themeMode = Provider.of<ThemeManager>(context).themeMode;
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: _themeMode,
      home: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeMode,
        home: MainScreen(),
        initialRoute: '/loginScreen',
        routes: {
          MainScreen.name: (context) => MainScreen(),
          AddDeviceScreen.name: (context) => const AddDeviceScreen()
        },
      ),
    );
  }
}
