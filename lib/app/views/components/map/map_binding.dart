import 'package:connect/app/views/components/map/map_controller.dart';
import 'package:get/instance_manager.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapController());
  }
}
