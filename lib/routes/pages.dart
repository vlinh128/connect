import 'package:connect/app/views/activity_detail/activity_detail_page.dart';
import 'package:connect/app/views/components/map/map_binding.dart';
import 'package:connect/app/views/components/map/map_page.dart';
import 'package:connect/app/views/dashboard/dashboard_binding.dart';
import 'package:connect/app/views/dashboard/dashboard_page.dart';
import 'package:connect/routes/routes.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../app/views/splash/splash_binding.dart';
import '../app/views/splash/splash_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashBoardPage(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.home,
    //   page: () => const HomePage(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.profile,
    //   page: () => const ProfilePage(),
    //   binding: ProfileBinding(),
    // ),
    GetPage(
      name: AppRoutes.map,
      page: () => const MapPage(),
      // binding: MapBinding(),
    ),
  ];
}

class _AppGetMiddleware<T extends GetxController> extends GetMiddleware {}
