import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_spoon_app/constants/theme_constants.dart';
import 'package:smart_spoon_app/models/preferences.dart';
import 'package:smart_spoon_app/services/prefernces_service.dart';
import 'package:smart_spoon_app/views/home_screen/home_screen.dart';
import 'package:smart_spoon_app/views/splash_screen/splash_screen.dart';
import 'blocs/preferences_bloc/preferences_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PreferencesCubit>(
      future: buildBloc(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return BlocProvider(
            create: (_) => snapshot.data!,
            child: BlocBuilder<PreferencesCubit, Preferences>(
              builder: (context, prefs) => MaterialApp(
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: prefs.themeMode,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: prefs.lanCode == 'ar'
                    ? const Locale("ar")
                    : const Locale("en"),
                home: HomeScreen(),
                initialRoute: HomeScreen.name,
                routes: {
                  HomeScreen.name: (context) => HomeScreen(),
                },
                debugShowCheckedModeBanner: false,
              ),
            ),
          );
        }
        return const SplashScreen();
      },
    );
  }
}

Future<PreferencesCubit> buildBloc() async {
  final prefs = await SharedPreferences.getInstance();
  final service = MyPreferencesService(prefs);
  return PreferencesCubit(service, service.get());
}
