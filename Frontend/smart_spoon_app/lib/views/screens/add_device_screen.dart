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
        title: const Text("Add Device"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.only(top: 50),
              child: Center(
                child: Lottie.asset(
                  'assets/add_device.json',
                  fit: BoxFit.scaleDown,
                  repeat: false,
                ),
              ),
            ),
            const AddDeviceFormWidget(),
          ],
        ),
      ),
    );
  }
}
