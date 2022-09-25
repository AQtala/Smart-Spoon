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
                size: 38,
                color: COLOR_PRIMARY_DARK,
              ),
              onTap: () {
                scaffoldKey.currentState!.openEndDrawer();
              },
            ),
            ListTile(
              title: const Text(
                'Language',
                style: TextStyle(
                  color: COLOR_PRIMARY_DARK,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  overflow: TextOverflow.visible,
                ),
              ),
              trailing: DropdownButton(
                icon: const Icon(
                  Icons.language_rounded,
                  size: 35,
                  color: COLOR_PRIMARY_DARK,
                ),
                underline: const SizedBox(),
                items: [
                  DropdownMenuItem(
                    value: const Locale('en'),
                    child: const Text('English'),
                  ),
                  DropdownMenuItem(
                    value: const Locale('ar'),
                    child: const Text('العربية'),
                  ),
                ],
                onChanged: (Locale? value) {},
              ),
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
              trailing: DropdownButton(
                icon: const Icon(
                  Icons.display_settings_rounded,
                  size: 35,
                  color: COLOR_PRIMARY_DARK,
                ),
                underline: const SizedBox(),
                items: [
                  DropdownMenuItem(
                    value: "Light",
                    child: const Text('Light'),
                  ),
                  DropdownMenuItem(
                    value: "Dark",
                    child: const Text('Dark'),
                  ),
                  DropdownMenuItem(
                    value: "System",
                    child: const Text('System'),
                  ),
                ],
                onChanged: (String? value) {
                  if (value == null || value == "System") {
                    prefCubit.changePreferences(
                        preferences.copyWith(themeMode: ThemeMode.system));
                  } else if (value == "Dark") {
                    prefCubit.changePreferences(
                        preferences.copyWith(themeMode: ThemeMode.dark));
                  } else if (value == "Light") {
                    prefCubit.changePreferences(
                        preferences.copyWith(themeMode: ThemeMode.light));
                  }
                },
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
                size: 35,
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
