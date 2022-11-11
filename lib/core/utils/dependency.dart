import 'package:connect/app/data/provider/cloud_firestore_provider.dart';
import 'package:connect/app/data/provider/get_storage_provider.dart';
import 'package:connect/app/data/repository_impl/activity_repo_impl.dart';
import 'package:connect/app/data/repository_impl/setting_repo_impl.dart';
import 'package:connect/app/domains/activity/activity_use_case.dart';
import 'package:connect/app/domains/setting/setting_use_case.dart';
import 'package:connect/app/views/home/home_controller.dart';
import 'package:connect/app/views/inital/initial_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Dependency {
  static init() async {
    //setting App dependencies
    await GetStorage.init();

    await Firebase.initializeApp();

    Get.lazyPut(() => GetStorageProvider());
    Get.lazyPut(() => CloudFirestoreProvider());

    Get.lazyPut<SettingRepositoryImpl>(
        () => SettingRepositoryImpl(Get.find<GetStorageProvider>()));

    Get.lazyPut<ActivityRepoImpl>(
        () => ActivityRepoImpl(Get.find<CloudFirestoreProvider>()));

    Get.lazyPut<SettingUseCase>(
        () => SettingUseCase(Get.find<SettingRepositoryImpl>()));

    Get.lazyPut<ActivityUseCase>(
        () => ActivityUseCase(Get.find<ActivityRepoImpl>()));

    await Get.putAsync<InitialService>(
        () => InitialService(Get.find<SettingUseCase>()).init());
  }
}
