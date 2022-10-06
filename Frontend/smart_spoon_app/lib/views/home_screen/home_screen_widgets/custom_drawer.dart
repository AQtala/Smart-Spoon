import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/preferences_bloc/preferences_cubit.dart';
import '../../../models/preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.size, required this.scaffoldKey})
      : super(key: key);
  final Size size;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final prefCubit = context.read<PreferencesCubit>();
    var _theme = Theme.of(context);
    return BlocBuilder<PreferencesCubit, Preferences>(
      builder: (context, preferences) => Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.only(top: size.height * 0.1),
              child: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  AppLocalizations.of(context)!.settings,
                  style: TextStyle(
                      color: _theme.canvasColor, fontSize: size.width * 0.12),
                ),
              ),
              decoration: BoxDecoration(
                color: _theme.colorScheme.primary,
              ),
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.homePage,
                style: TextStyle(
                  color: _theme.canvasColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  overflow: TextOverflow.visible,
                ),
              ),
              trailing: Icon(
                Icons.home_outlined,
                size: 38,
                color: _theme.canvasColor,
              ),
              onTap: () {
                scaffoldKey.currentState!.openEndDrawer();
              },
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.language,
                style: TextStyle(
                  color: _theme.canvasColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  overflow: TextOverflow.visible,
                ),
              ),
              trailing: DropdownButton(
                icon: Icon(
                  Icons.language_rounded,
                  size: 35,
                  color: _theme.canvasColor,
                ),
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: Locale('ar'),
                    child: Text('العربية'),
                  ),
                ],
                onChanged: (Locale? value) {
                  if (value == null ||
                      value.languageCode == prefCubit.state.lanCode) return;

                  if (value.languageCode == "en") {
                    prefCubit.changePreferences(
                      preferences.copyWith(lanCode: value.languageCode),
                    );
                  } else if (value.languageCode == "ar") {
                    prefCubit.changePreferences(
                      preferences.copyWith(lanCode: value.languageCode),
                    );
                  }
                },
              ),
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.darkMode,
                style: TextStyle(
                  color: _theme.canvasColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  overflow: TextOverflow.visible,
                ),
              ),
              trailing: DropdownButton(
                icon: Icon(
                  Icons.display_settings_rounded,
                  size: 35,
                  color: _theme.canvasColor,
                ),
                underline: const SizedBox(),
                items: [
                  DropdownMenuItem(
                    value: "Light",
                    child: Text(AppLocalizations.of(context)!.light),
                  ),
                  DropdownMenuItem(
                    value: "Dark",
                    child: Text(AppLocalizations.of(context)!.dark),
                  ),
                  DropdownMenuItem(
                    value: "System",
                    child: Text(AppLocalizations.of(context)!.system),
                  ),
                ],
                onChanged: (String? value) {
                  if (value == null ||
                      value == prefCubit.state.themeMode.name) {
                    return;
                  }
                  if (value == "System") {
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
              title: Text(
                AppLocalizations.of(context)!.exit,
                style: TextStyle(
                  color: _theme.canvasColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  overflow: TextOverflow.visible,
                ),
              ),
              trailing: Icon(
                Icons.exit_to_app_rounded,
                size: 35,
                color: _theme.canvasColor,
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
