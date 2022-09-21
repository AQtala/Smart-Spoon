import 'package:flutter/material.dart';
import 'package:smart_spoon_app/views/widgets/ui/CustomIconButton.dart';

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
    final _theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomIconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  url: 'assets/icons/menus.png',
                  iconColor: _theme.canvasColor,
                ),
                const Text(
                  "App_Name",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    overflow: TextOverflow.visible,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      color: _theme.primaryColor,
    );
  }
}
