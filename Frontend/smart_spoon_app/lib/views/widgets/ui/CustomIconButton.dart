import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      required this.onPressed,
      required this.url,
      required this.iconColor})
      : super(key: key);
  final Function onPressed;
  final String url;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      alignment: Alignment.topLeft,
      color: Colors.transparent,
      margin: const EdgeInsets.only(left: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            minimumSize: const Size(30, 30),
            maximumSize: const Size(50, 50)),
        onPressed: () => onPressed(),
        child: Image.asset(
          url,
          color: iconColor,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
