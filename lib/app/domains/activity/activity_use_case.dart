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
}
