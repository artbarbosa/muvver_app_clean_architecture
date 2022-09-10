import 'package:muvver_app/app/modules/traveler/domain/entities/traveler_entity.dart';
import 'package:muvver_app/app/modules/traveler/infra/adapters/json_to_traveler.dart';

import '../../../../core/shared/failures/failures.dart';
import '../../domain/errors/traveler_errors.dart';
import '../../domain/repositories/traveler_repository_interface.dart';
import '../datasource/traveler_datasource_interface.dart';

class TravelerRepository implements ITravelerRepository {
  final ITravelerDatasource datasource;
  TravelerRepository({
    required this.datasource,
  });

  @override
  Future<void> addTraveler(TravelerEntity traveler) async {
    try {
      final map = JsonToTraveler.toMap(traveler);
      await datasource.addTraveler(map);
    } on NoInternetConnection catch (e) {
      rethrow;
    } catch (e, stackTrace) {
      throw TravelerRepositoryError(
          label: e.toString(),
          exception: e,
          errorMessage: 'TravelerRepositoryError - getAllProducts',
          stackTrace: stackTrace);
    }
  }
}
