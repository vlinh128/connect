import 'package:connect/app/domains/activity/activity_use_case.dart';
import 'package:connect/app/views/components/map/map_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ActivityDetailController extends GetxController {
  final ActivityUseCase _activityUseCase;

  ActivityDetailController(this._activityUseCase);

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

  updateSelectedLocation(UserLocation? newLocation) {
    selectedLocation = newLocation;
    update();
  }
}
