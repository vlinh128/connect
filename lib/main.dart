import 'package:connect/app/views/inital/initial_service.dart';
import 'package:connect/core/themes/theme.dart';
import 'package:connect/core/translations/app_translations.dart';
import 'package:connect/core/utils/dependency.dart';
import 'package:connect/routes/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);

  await Dependency.init();

  final _initialService = Get.find<InitialService>();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      defaultTransition: Transition.cupertino,
      getPages: AppPages.pages,
      initialRoute: _initialService.firstPage,
      theme: AppTheme.dark,
      locale: _initialService.locale,
    ),
  );
}
