import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect/app/data/provider/cloud_firestore_provider.dart';
import 'package:connect/app/domains/activity/activity_entity.dart';
import 'package:flutter/material.dart';

import '../../domains/activity/activity_repo.dart';

const collectionName = "activities";

class ActivityRepoImpl implements ActivityRepository {
  ActivityRepoImpl(this._provider);

  final CloudFirestoreProvider _provider;

  @override
  Future<ActivityEntity?> createActivity(
      {required ActivityEntity entity}) async {
    final docRef = await _provider.firestore
        .collection(collectionName)
        .add(entity.toMap());
    final fsActivity = await docRef.get();

    if (fsActivity.data() != null) {
      final activity = ActivityEntity.fromMapFs(fsActivity.data()!);
      activity.id = fsActivity.id;

      return activity;
    }

    return null;
  }

  @override
  Future<List<ActivityEntity>> getActivities() async {
    final docRef = await _provider.firestore.collection(collectionName).get();
    List<ActivityEntity> activities = [];

    docRef.docs.forEach((element) {
      final activity = ActivityEntity.fromMapFs(element.data());
      activity.id = element.id;
      activities.add(activity);
    });

    return activities;
  }

  @override
  Future<ActivityEntity?> addImage(
      ActivityEntity activity, String imageURL) async {
    final docRef = await _provider.firestore
        .collection(collectionName)
        .doc(activity.id)
        .update({
      "images": FieldValue.arrayUnion([imageURL])
    });

    final activityDoc = await _provider.firestore
        .collection(collectionName)
        .doc(activity.id)
        .get();

    if (activityDoc.data() == null) {
      return null;
    }

    final newActivity = ActivityEntity.fromMapFs(activityDoc.data()!);
    newActivity.id = activityDoc.id;

    return newActivity;
  }

  @override
  Future<ActivityEntity?> getActivity(String id) async {
    final activityDoc =
        await _provider.firestore.collection(collectionName).doc(id).get();

    if (activityDoc.data() == null) {
      return null;
    }

    final newActivity = ActivityEntity.fromMapFs(activityDoc.data()!);
    newActivity.id = activityDoc.id;

    return newActivity;
  }
}
