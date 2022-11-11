import 'package:connect/app/views/components/bottom_navigation_bar_view.dart';
import 'package:connect/app/views/dashboard/dashboard_controller.dart';
import 'package:connect/app/views/home/home_page.dart';
import 'package:connect/app/views/profile/profile_page.dart';
import 'package:connect/app/views/create/create_activity_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (_) {
      return Scaffold(
          body: SafeArea(
            bottom: false,
            child: IndexedStack(
              index: _.selectedIdx,
              children: const [
                HomePage(),
                CreateActivityPage(),
                ProfilePage(),
              ],
            ),
            // bottomNavigationBar: ,r
          ),
          bottomNavigationBar: BottomNavigationBarView());
    });
  }
}
