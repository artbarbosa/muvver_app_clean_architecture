import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:muvver_app/app/core/shared/failures/failures.dart';
import 'package:muvver_app/app/modules/traveler/domain/errors/traveler_errors.dart';
import 'package:muvver_app/app/modules/traveler/infra/adapters/json_to_traveler.dart';
import 'package:muvver_app/app/modules/traveler/infra/repositories/traveler_repository.dart';

import '../../../../../mock/mock.dart';

void main() {
  late ITravelerDataSourceMock datasoucer;
  late TravelerRepository repository;

  setUpAll(() {
    datasoucer = ITravelerDataSourceMock();
    repository = TravelerRepository(datasource: datasoucer);
  });

  group('Traveler Repository - addTraveler', () {
    test('Should call the method  addTraveler', () async {
      final map = JsonToTraveler.toMap(travelerEntityTest);
      when(() => datasoucer.addTraveler(map)).thenAnswer((_) async {});

      await repository.addTraveler(travelerEntityTest);

      verify(() => datasoucer.addTraveler(map)).called(1);
    });

    test('Should Throw NoInternetConnection', () async {
      final map = JsonToTraveler.toMap(travelerEntityTest);

      when(() => datasoucer.addTraveler(map)).thenThrow(NoInternetConnection());

      expect(() async => await repository.addTraveler(travelerEntityTest),
          throwsA(isA<NoInternetConnection>()));
    });

    test('Should Throw TravelerRepositoryError', () async {
      final map = JsonToTraveler.toMap(travelerEntityTest);

      when(() => datasoucer.addTraveler(map)).thenThrow(Exception());

      expect(() async => await repository.addTraveler(travelerEntityTest),
          throwsA(isA<TravelerRepositoryError>()));
    });
  });
}
