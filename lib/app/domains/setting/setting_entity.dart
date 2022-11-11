class SettingEntity {
  String languageCode;
  String currencyCode;
  bool isLightTheme;
  bool isFirstTime;
  String biometricType;

  SettingEntity({
    required this.languageCode,
    required this.currencyCode,
    required this.isLightTheme,
    required this.isFirstTime,
    required this.biometricType,
  });

  static const keyStorage = 'setting-app';

  bool get isVietnamese => languageCode == 'vi';
}
