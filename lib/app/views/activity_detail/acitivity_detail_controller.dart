import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connect/app/domains/activity/activity_entity.dart';
import 'package:connect/app/domains/activity/activity_use_case.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class ActivityDetailController extends GetxController {
  final ActivityUseCase _activityUseCase;

  ActivityDetailController(this._activityUseCase);
  final ImagePicker _imagePicker = ImagePicker();
  late ActivityEntity activity;

  Future<void> getActivity(String id) async {
    var newActivity = await _activityUseCase.getActivity(id);
    if (newActivity != null) {
      activity = newActivity;
      update();
    }
  }

  Future<void> checkIn(BuildContext ctx, ActivityEntity activityEntity) async {
    final XFile? pickFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickFile == null) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.amber,
          content: Text('No file was selected'),
        ),
      );

      return null;
    }

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('connects')
        .child(activityEntity.name)
        .child('/${DateTime.now().microsecondsSinceEpoch}.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': pickFile.path},
    );

    final taskSnapshot = await ref.putFile(io.File(pickFile.path), metadata);

    final imageURL = await ref.getDownloadURL();

    // update activities
    final newActivity =
        await _activityUseCase.addImageForActivity(activityEntity, imageURL);

    if (newActivity != null) {
      activity = newActivity;

      await AwesomeDialog(
        context: ctx,
        headerAnimationLoop: false,
        dialogType: DialogType.noHeader,
        title: 'Success',
        desc: 'Check In Success',
        btnOkOnPress: () {},
        btnOkIcon: Icons.check_circle,
      ).show();
    }

    update();
  }

  int getNumberOfShowImages() {
    if (activity.images == null) {
      return 0;
    }

    return activity.images!.length;
  }
}
