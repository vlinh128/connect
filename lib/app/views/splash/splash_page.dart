import 'package:connect/app/views/splash/splash_controller.dart';
import 'package:connect/core/themes/colors.dart';
import 'package:connect/core/themes/styles.dart';
import 'package:connect/core/translations/en.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              splashPageLabel.tr,
              style: AppTextStyle.title(context),
            ),
            const SizedBox(height: 32),
            CupertinoButton(
              onPressed: controller.toHomePage,
              color: AppColors.button(context),
              child: Text(
                nextButtonLabel.tr,
                style: AppTextStyle.button(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
