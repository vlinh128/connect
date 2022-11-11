import 'package:connect/app/domains/setting/setting_entity.dart';
import 'package:connect/app/domains/setting/setting_repo.dart';

class SettingUseCase {
  SettingUseCase(this._settingRepo);

  final SettingRepository _settingRepo;

  late final SettingEntity settingEntity;

  void getSettingApp() {
    settingEntity = _settingRepo.getSettingApp(key: SettingEntity.keyStorage);
  }

  Future<void> updateFirstTimeApp() async {
    settingEntity.isFirstTime = false;
    await _settingRepo.updateSettingApp(
      key: SettingEntity.keyStorage,
      entity: settingEntity,
    );
  }

  Future<void> updateThemeApp() async {
    settingEntity.isLightTheme = !settingEntity.isLightTheme;
    await _settingRepo.updateSettingApp(
      key: SettingEntity.keyStorage,
      entity: settingEntity,
    );
  }

  Future<void> updateLanguageApp({required String languageCode}) async {
    settingEntity.languageCode = languageCode;
    await _settingRepo.updateSettingApp(
      key: SettingEntity.keyStorage,
      entity: settingEntity,
    );
  }
}
