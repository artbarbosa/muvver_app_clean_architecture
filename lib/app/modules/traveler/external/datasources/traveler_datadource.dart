import 'package:muvver_app/app/core/shared/services/remote/http_client_service_interface.dart';

import '../../infra/datasource/traveler_datasource_interface.dart';

class TravelerDatasource implements ITravelerDatasource {
  final IHttpService client;

  TravelerDatasource(this.client);

  @override
  Future<void> addTraveler(Map<String, dynamic> map) async {
    client.post('addTraveler', queryParameters: map);
  }
}
