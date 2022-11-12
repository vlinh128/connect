import 'package:connect/app/domains/activity/activity_entity.dart';

abstract class ActivityRepository {
  Future<ActivityEntity?> createActivity({
    required ActivityEntity entity,
  });

  Future<List<ActivityEntity>> getActivities();
  Future<ActivityEntity?> getActivity(String id);

  Future<ActivityEntity?> addImage(ActivityEntity activity, String imageURL);
}
