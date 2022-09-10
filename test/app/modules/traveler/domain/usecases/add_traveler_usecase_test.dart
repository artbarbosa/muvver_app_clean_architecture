import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:muvver_app/app/modules/traveler/domain/usecases/add_traveler_usecase.dart';

import '../../../../../mock/mock.dart';

void main() {
  late ITravelerRepositoryMock repository;
  late AddTravelerUseCase usecase;

  setUpAll(() {
    repository = ITravelerRepositoryMock();
    usecase = AddTravelerUseCase(repository);
  });

  test('Should call the method  addTraveler', () async {
    when(() => repository.addTraveler(travelerEntityMock))
        .thenAnswer((_) async {});

    await usecase.call(travelerEntityMock);

    verify(() => repository.addTraveler(travelerEntityMock)).called(1);
  });
}
