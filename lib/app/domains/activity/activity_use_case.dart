import 'package:connect/app/domains/activity/activity_entity.dart';
import 'package:connect/app/domains/activity/activity_repo.dart';

class ActivityUseCase {
  ActivityUseCase(this._activityRepo);

  final ActivityRepository _activityRepo;

  Future<ActivityEntity?> createActivity(ActivityEntity activityEntity) async {
    return await _activityRepo.createActivity(
      entity: activityEntity,
    );
  }

  Future<ActivityEntity?> getActivity(String id) async {
    return await _activityRepo.getActivity(id);
  }

  Future<ActivityEntity?> addImageForActivity(
      ActivityEntity activityEntity, String imageURL) async {
    return await _activityRepo.addImage(activityEntity, imageURL);
  }
}
