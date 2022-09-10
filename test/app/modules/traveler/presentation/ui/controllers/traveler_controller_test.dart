import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:muvver_app/app/modules/traveler/domain/usecases/add_traveler_usecase.dart';
import 'package:muvver_app/app/modules/traveler/presentation/ui/controllers/traveler_controller.dart';
import 'package:muvver_app/app/modules/traveler/presentation/ui/states/traveler_states.dart';

import '../../../../../../mock/mock.dart';

class IAddTrevalerUseCaseMock extends Mock implements IAddTravelerUseCase {}

void main() {
  late TravelerController controller;
  late IAddTrevalerUseCaseMock usecase;

  setUpAll(() {
    usecase = IAddTrevalerUseCaseMock();
    controller = TravelerController(addTravelerUseCase: usecase);
  });

  group('TravelerController - addTraveler', () {
    test('Should get and change value TrevalerSuccessState', () async {
      when(() => usecase.call(travelerEntityMock)).thenAnswer((_) async {});
      controller.traveler = travelerEntityMock;

      await controller.addTraverler();

      expect(controller.value, isA<TravelerSuccessState>());
    });

    test('Should change value TravelerErrorState', () async {
      when(() => usecase.call(travelerEntityMock)).thenThrow(Exception());

      await controller.addTraverler();

      expect(controller.value, isA<TravelerErrorState>());
    });
  });
}
