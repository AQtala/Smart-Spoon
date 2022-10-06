import 'package:flutter/material.dart';

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.scaffoldKey})
      : super(key: key);
  final double width, height;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
      width: width,
      height: height * 0.1,
      decoration: BoxDecoration(
        color: _theme.colorScheme.surface,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      ),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () => {scaffoldKey.currentState!.openDrawer()},
            child: Icon(
              Icons.menu_rounded,
              color: _theme.colorScheme.onPrimary,
              size: 30,
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(width * 0.18, width * 0.18),
              shape: const CircleBorder(),
              elevation: 0,
              backgroundColor: _theme.colorScheme.primary,
            ),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: Icon(
              Icons.add_rounded,
              color: _theme.colorScheme.onSecondary,
              size: 30,
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(width * 0.18, width * 0.18),
              shape: const CircleBorder(),
              elevation: 0,
              backgroundColor: _theme.colorScheme.secondary,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}
