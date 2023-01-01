import 'package:bloc/bloc.dart';
import 'package:smart_spoon_app/models/preferences.dart';
import 'package:smart_spoon_app/services/prefernces_service.dart';

class PreferencesCubit extends Cubit<Preferences> {
  final PreferencesService _preferencesService;
  PreferencesCubit(this._preferencesService, Preferences initState)
      : super(initState);

  Future<void> changePreferences(Preferences preferences) async {
    await _preferencesService.set(preferences);
    emit(preferences);
  }
}
