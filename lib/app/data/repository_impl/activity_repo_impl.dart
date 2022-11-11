import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect/app/data/provider/cloud_firestore_provider.dart';
import 'package:connect/app/domains/activity/activity_entity.dart';

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
    final fsActivity = (await docRef.get()).data();

    if (fsActivity != null) {
      return ActivityEntity.fromMapFs(fsActivity);
    }

    return null;
  }

  @override
  Future<List<ActivityEntity>> getActivities() async {
    final docRef = await _provider.firestore.collection(collectionName).get();
    List<ActivityEntity> activities = [];

    docRef.docs.forEach((element) {
      final activity = ActivityEntity.fromMapFs(element.data());
      activities.add(activity);
    });

    return activities;
  }
}
