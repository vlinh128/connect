import 'package:connect/app/domains/activity/activity_use_case.dart';
import 'package:connect/app/views/create/created_acitivity_controller.dart';
import 'package:connect/app/views/dashboard/dashboard_controller.dart';
import 'package:get/instance_manager.dart';

import '../profile/profile_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
    Get.lazyPut(() => CreateActivityController(Get.find<ActivityUseCase>()));
    Get.lazyPut(() => ProfileController());
  }
}
