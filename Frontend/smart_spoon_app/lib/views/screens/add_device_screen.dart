import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/login_widgets/add_device_form_widget.dart';

class AddDeviceScreen extends StatelessWidget {
  static String name = "/loginScreen";
  const AddDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: const Color.fromARGB(255, 0, 207, 155),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/healthcare-loader.json',
              animate: true,
              repeat: true,
            ),
            const AddDeviceFormWidget(),
          ],
        ),
      ),
    );
  }
}
