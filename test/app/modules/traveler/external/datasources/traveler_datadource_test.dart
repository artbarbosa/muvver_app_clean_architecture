import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:muvver_app/app/core/shared/failures/failures.dart';
import 'package:muvver_app/app/core/shared/services/remote/http_client_service_interface.dart';
import 'package:muvver_app/app/modules/traveler/domain/errors/traveler_errors.dart';
import 'package:muvver_app/app/modules/traveler/external/datasources/traveler_datadource.dart';

class HttpServiceMock extends Mock implements IHttpService {}

void main() {
  late HttpServiceMock httpClient;
  late TravelerDatasource datasource;

  setUpAll(() {
    httpClient = HttpServiceMock();
    datasource = TravelerDatasource(httpClient);
  });

  group('TravelerDatasource - addTraveler', () {
    test('Should call the method  post', () async {
      when(() => httpClient.post(any(), queryParameters: {}))
          .thenAnswer((_) async {});

      await datasource.addTraveler({});

      verify(() => httpClient.post('addTraveler', queryParameters: {}))
          .called(1);
    });

    test('Should Throw NoInternetConnection', () async {
      when(() => httpClient.post(any(), queryParameters: {}))
          .thenThrow(NoInternetConnection());

      expect(() async => await datasource.addTraveler({}),
          throwsA(isA<TravelerDatasourceInternetConnection>()));
    });

    test('Should Throw TravelerepositoryError', () async {
      when(() => httpClient.post(any())).thenThrow(Exception());

      expect(() async => await datasource.addTraveler({}),
          throwsA(isA<TravelerDatasourceError>()));
    });
  });
}
