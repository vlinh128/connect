import 'package:get/get.dart';

class DashBoardController extends GetxController {
  var selectedIdx = 0;

  void changePage(int idx) {
    if (idx != selectedIdx) {
      selectedIdx = idx;
      update();
    }
  }
}
