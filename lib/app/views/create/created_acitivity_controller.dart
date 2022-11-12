import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connect/app/domains/activity/activity_entity.dart';
import 'package:connect/app/domains/activity/activity_use_case.dart';
import 'package:connect/app/views/components/map/map_controller.dart';
import 'package:connect/app/views/dashboard/dashboard_controller.dart';
import 'package:connect/app/views/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CreateActivityController extends GetxController {
  final ActivityUseCase _activityUseCase;

  CreateActivityController(this._activityUseCase);

  UserLocation? selectedLocation;

  final formKey = GlobalKey<FormBuilderState>();
  final initialValue = {
    "createdBy": "You",
    'name': "Your Activity",
    "description": "This is Activity",
    "startTime": DateTime.now(),
    "endTime": DateTime.now().add(const Duration(hours: 2)),
    "gender": 'Male',
    "tags": null,
  };

  Future<void> createActivity(BuildContext ctx) async {
    if ((formKey.currentState?.saveAndValidate() ?? false) &&
        selectedLocation != null) {
      Map<String, dynamic> data = {
        'lat': selectedLocation?.location!.latitude,
        'long': selectedLocation?.location!.longitude,
        'locationDesc': selectedLocation?.desc,
      };

      formKey.currentState?.value.entries.forEach((element) {
        data[element.key] = element.value;
      });

      debugPrint(data.toString());

      final activity = ActivityEntity.fromMap(data);
      final newActivity = await _activityUseCase.createActivity(activity);

      if (newActivity != null) {
        AwesomeDialog(
          context: ctx,
          headerAnimationLoop: false,
          dialogType: DialogType.noHeader,
          title: 'Success',
          desc: 'Create New Activity Success',
          btnOkOnPress: () {
            resetForm();
            Get.find<DashBoardController>().changePage(0);
            Get.find<HomeController>().getActivities();
          },
          btnOkIcon: Icons.check_circle,
        ).show();
      }
    } else {
      debugPrint(formKey.currentState?.value.toString());
    }
  }

  void resetForm() {
    selectedLocation = null;
    formKey.currentState?.reset();
    update();
  }

  updateSelectedLocation(UserLocation? newLocation) {
    selectedLocation = newLocation;
    update();
  }
}
