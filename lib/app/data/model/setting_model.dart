import 'package:connect/app/domains/setting/setting_entity.dart';
import 'dart:convert';

class SettingModel extends SettingEntity {
  SettingModel({
    required String languageCode,
    required String currencyCode,
    required String biometricType,
    required bool isLightTheme,
    required bool isFirstTime,
  }) : super(
          currencyCode: currencyCode,
          isLightTheme: isLightTheme,
          isFirstTime: isFirstTime,
          biometricType: biometricType,
          languageCode: languageCode,
        );

  factory SettingModel.fromEntity(SettingEntity entity) {
    return SettingModel(
      languageCode: entity.languageCode,
      currencyCode: entity.currencyCode,
      biometricType: entity.biometricType,
      isLightTheme: entity.isLightTheme,
      isFirstTime: entity.isFirstTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'language': languageCode,
      'currency': currencyCode,
      'isLightTheme': isLightTheme,
      'isFirstTime': isFirstTime,
      'biometricType': biometricType,
    };
  }

  factory SettingModel.fromMap(Map<String, dynamic> map) {
    return SettingModel(
      languageCode: map['language'],
      currencyCode: map['currency'],
      isLightTheme: map['isLightTheme'],
      isFirstTime: map['isFirstTime'],
      biometricType: map['biometricType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingModel.fromJson(String source) =>
      SettingModel.fromMap(json.decode(source));
}
