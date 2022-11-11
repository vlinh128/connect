import 'package:connect/app/views/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationBarView extends StatelessWidget {
  BottomNavigationBarView({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<DashBoardController>();

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
        currentIndex: controller.selectedIdx,
        onTap: (idx) => controller.changePage(idx),
        selectedItemColor: Colors.green,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
          ),

          // /// Likes
          // SalomonBottomBarItem(
          //   icon: const Icon(Icons.favoritecontrollerborder),
          //   title: const Text("Likes"),
          //   selectedColor: Colors.pink,
          // ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.create_rounded),
            title: const Text("Create"),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
          ),
        ]);
  }
}
