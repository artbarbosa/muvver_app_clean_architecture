import 'package:muvver_app/app/core/shared/services/remote/http_client_service_interface.dart';

import '../../../../core/shared/failures/failures.dart';
import '../../domain/errors/traveler_errors.dart';
import '../../infra/datasource/traveler_datasource_interface.dart';

class TravelerDatasource implements ITravelerDatasource {
  final IHttpService client;

  TravelerDatasource(this.client);

  @override
  Future<void> addTraveler(Map<String, dynamic> map) async {
    try {
      await client.post('addTraveler', queryParameters: map);
    } on NoInternetConnection catch (e) {
      throw TravelerDatasourceInternetConnection();
    } catch (e, stackTrace) {
      throw TravelerDatasourceError(
          label: e.toString(),
          exception: e,
          errorMessage: 'ProductDataSourceError - getAllProducts',
          stackTrace: stackTrace);
    }
  }
}
