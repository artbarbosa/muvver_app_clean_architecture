import 'package:muvver_app/app/modules/traveler/domain/entities/traveler_entity.dart';

abstract class ITravelerRepository {
  Future<void> addTraveler(TravelerEntity traveler);
}
