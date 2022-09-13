import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/login_widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
            const LoginFormWidget(),
          ],
        ),
      ),
    );
  }
}
