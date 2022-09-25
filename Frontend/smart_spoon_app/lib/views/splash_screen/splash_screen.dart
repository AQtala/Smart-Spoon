import 'package:flutter/material.dart';
import 'package:smart_spoon_app/constants/theme_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: COLOR_PRIMARY,
          child: const Center(
            child: CircularProgressIndicator(
              value: null,
              strokeWidth: 7.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
