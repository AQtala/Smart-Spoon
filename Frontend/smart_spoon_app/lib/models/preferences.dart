import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'preferences.g.dart';

@JsonSerializable()
class Preferences {
  // ignore: constant_identifier_names
  static const THEME_MODE_DEFAULT_VALUE = ThemeMode.system;
  // ignore: constant_identifier_names
  static const lanCode_DEFAULT_VALUE = "en";

  @JsonKey(defaultValue: THEME_MODE_DEFAULT_VALUE)
  final ThemeMode themeMode;

  @JsonKey(defaultValue: lanCode_DEFAULT_VALUE)
  final String lanCode;

  Preferences({required this.themeMode, required this.lanCode});

  factory Preferences.defaultValues() {
    return Preferences(
      themeMode: THEME_MODE_DEFAULT_VALUE,
      lanCode: lanCode_DEFAULT_VALUE,
    );
  }

  factory Preferences.fromJson(json) =>
      _$PreferencesFromJson(Map<String, dynamic>.from(json));

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  Preferences copyWith({
    ThemeMode? themeMode,
    String? lanCode,
  }) {
    return Preferences(
      themeMode: themeMode ?? this.themeMode,
      lanCode: lanCode ?? this.lanCode,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Preferences &&
            themeMode == other.themeMode &&
            lanCode == other.lanCode);
  }

  @override
  int get hashCode => (themeMode.hashCode + lanCode.hashCode);

  @override
  String toString() {
    return "Preferences($themeMode  $lanCode)";
  }
}
