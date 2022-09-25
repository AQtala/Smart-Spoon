import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/preferences_bloc/preferences_cubit.dart';
import '../../../constants/theme_constants.dart';
import '../../../models/preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.size, required this.scaffoldKey})
      : super(key: key);
  final Size size;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final prefCubit = context.read<PreferencesCubit>();
    return BlocBuilder<PreferencesCubit, Preferences>(
      builder: (context, preferences) => Drawer(
        backgroundColor: COLOR_PRIMARY,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.only(top: size.height * 0.1),
              child: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: COLOR_PRIMARY_DARK, fontSize: size.width * 0.12),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(
                  color: COLOR_PRIMARY_DARK,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  overflow: TextOverflow.visible,
                ),
              ),
              trailing: const Icon(
                Icons.home_outlined,
                size: 40,
                color: COLOR_PRIMARY_DARK,
              ),
              onTap: () {
                scaffoldKey.currentState!.openEndDrawer();
              },
            ),
            ListTile(
              title: const Text(
                'Dark Mode',
                style: TextStyle(
                  color: COLOR_PRIMARY_DARK,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  overflow: TextOverflow.visible,
                ),
              ),
              trailing: Switch(
                // value: _preferencesNotifier.themeMode == ThemeMode.light ? false : true,
                value:
                    prefCubit.state.themeMode == ThemeMode.dark ? true : false,
                onChanged: (newValue) => {
                  newValue == true
                      ? prefCubit.changePreferences(
                          preferences.copyWith(themeMode: ThemeMode.dark),
                        )
                      : prefCubit.changePreferences(
                          preferences.copyWith(themeMode: ThemeMode.light),
                        ),
                },
                activeColor: COLOR_ACCENT,
              ),
            ),
            ListTile(
              title: const Text(
                'Exit',
                style: TextStyle(
                  color: COLOR_PRIMARY_DARK,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  overflow: TextOverflow.visible,
                ),
              ),
              trailing: const Icon(
                Icons.exit_to_app_rounded,
                size: 40,
                color: COLOR_PRIMARY_DARK,
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
