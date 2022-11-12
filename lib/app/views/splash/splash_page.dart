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
      appBar: AppBar(
        title: const Text(
          "Let Enjoy",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Which Activities are you interested in ?",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
            ),
            const SizedBox(height: 32),
            CupertinoButton(
              onPressed: controller.toHomePage,
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              color: Colors.green,
              child: const Text(
                "Entertainment",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              onPressed: controller.toHomePage,
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              color: Colors.green,
              child: const Text(
                "Sport",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              onPressed: controller.toHomePage,
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              color: Colors.green,
              child: const Text(
                "Shopping",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              onPressed: controller.toHomePage,
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              color: Colors.green,
              child: const Text(
                "F&B",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              onPressed: controller.toHomePage,
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              color: Colors.green,
              child: const Text(
                "Learning",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              onPressed: controller.toHomePage,
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              color: Colors.green,
              child: const Text(
                "Volunteer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              onPressed: controller.toHomePage,
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              color: Colors.green,
              child: const Text(
                "Festival",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
