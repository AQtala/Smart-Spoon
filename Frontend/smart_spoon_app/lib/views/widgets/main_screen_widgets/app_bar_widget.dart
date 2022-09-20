import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget(
      {Key? key, required this.width, required this.height})
      : super(key: key);
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Color.fromARGB(255, 108, 226, 197),
    );
  }
}
