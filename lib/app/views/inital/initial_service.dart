import 'package:connect/app/domains/setting/setting_use_case.dart';
import 'package:connect/core/themes/theme.dart';
import 'package:connect/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class InitialService extends GetxService {
  InitialService(this._settingUseCase);

  final SettingUseCase _settingUseCase;

  Future<InitialService> init() async {
    _settingUseCase.getSettingApp();
    return this;
  }

  ThemeData theme() {
    return _settingUseCase.settingEntity.isLightTheme
        ? AppTheme.light
        : AppTheme.dark;
  }

  Locale get locale => Locale(_settingUseCase.settingEntity.languageCode);

  String get firstPage => _settingUseCase.settingEntity.isFirstTime
      ? AppRoutes.splash
      : AppRoutes.dashboard;
}
