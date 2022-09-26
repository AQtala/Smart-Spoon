import 'package:flutter/material.dart';

import '../../../constants/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget(
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
      height: height,
      width: width,
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                  color: COLOR_PRIMARY_DARK,
                  iconSize: 40,
                ),
                Text(
                  AppLocalizations.of(context)!.homePage,
                  style: const TextStyle(
                    color: COLOR_PRIMARY_DARK,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    overflow: TextOverflow.visible,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
          ],
        ),
      ),
      color: _theme.primaryColor,
    );
  }
}
