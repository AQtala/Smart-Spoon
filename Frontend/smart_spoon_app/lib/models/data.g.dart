// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      title: json['title'] as String,
      numberOfBites: json['numberOfBites'] as int,
      pitch: (json['pitch'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      roll: (json['roll'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'title': instance.title,
      'numberOfBites': instance.numberOfBites,
      'pitch': instance.pitch,
      'roll': instance.roll,
    };
