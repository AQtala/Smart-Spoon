import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_spoon_app/views/device_screen/device_screen.dart';

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
          ),
          SizedBox(
            height: height * 0.7,
            width: width,
            child: ListView(
              padding: const EdgeInsets.all(25),
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(DeviceScreen.name);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: _theme.colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    height: height * 0.1,
                    width: width * 0.2,
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.demo_device,
                        style: TextStyle(
                          color: _theme.colorScheme.primary,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: _theme.colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    height: height * 0.1,
                    width: width * 0.2,
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.demo_device,
                        style: TextStyle(
                          color: _theme.colorScheme.primary,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    height: height * 0.1,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: _theme.colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.demo_device,
                        style: TextStyle(
                          color: _theme.colorScheme.primary,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    height: height * 0.1,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: _theme.colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.demo_device,
                        style: TextStyle(
                          color: _theme.colorScheme.primary,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    height: height * 0.1,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: _theme.colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.demo_device,
                        style: TextStyle(
                          color: _theme.colorScheme.primary,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
