import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'preferences.g.dart';

@JsonSerializable()
class Preferences {
  // ignore: constant_identifier_names
  static const THEME_MODE_DEFAULT_VALUE = ThemeMode.system;
  // ignore: constant_identifier_names
  static const LOCAL_LANG = 'en';

  @JsonKey(defaultValue: THEME_MODE_DEFAULT_VALUE)
  final ThemeMode themeMode;

  get getThemeMode => themeMode;

  Preferences(this.themeMode);

  factory Preferences.defaultValues() {
    return Preferences(THEME_MODE_DEFAULT_VALUE);
  }

  factory Preferences.fromJson(json) =>
      _$PreferencesFromJson(Map<String, dynamic>.from(json));

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  Preferences copyWith({
    ThemeMode? themeMode,
  }) {
    return Preferences(themeMode ?? this.themeMode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Preferences && themeMode == other.themeMode);
  }

  @override
  int get hashCode => themeMode.hashCode;

  @override
  String toString() {
    return "Preferences($themeMode)";
  }
}
