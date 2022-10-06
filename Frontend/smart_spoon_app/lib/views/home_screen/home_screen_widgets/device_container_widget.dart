import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeviceContainer extends StatelessWidget {
  const DeviceContainer({Key? key, required this.width, required this.height})
      : super(key: key);
  final double width, height;

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      height: height * 0.9,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width * 0.3,
            height: height * 0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: _theme.colorScheme.secondary,
                  width: 2,
                ),
              ),
              color: Colors.transparent,
            ),
            child: Text(
              AppLocalizations.of(context)!.devices,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                color: _theme.colorScheme.secondary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
