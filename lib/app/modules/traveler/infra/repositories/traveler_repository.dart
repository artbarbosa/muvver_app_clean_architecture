import 'package:muvver_app/app/modules/traveler/domain/entities/traveler_entity.dart';
import 'package:muvver_app/app/modules/traveler/infra/adapters/json_to_traveler.dart';

import '../../domain/repositories/traveler_repository_interface.dart';
import '../datasource/traveler_datasource_interface.dart';

class TravelerRepository implements ITravelerRepository {
  final ITravelerDatasource datasource;
  TravelerRepository({
    required this.datasource,
  });

  @override
  Future<void> addTraveler(TravelerEntity traveler) async {
    final map = JsonToTraveler.toMap(traveler);
    await datasource.addTraveler(map);
  }
}
