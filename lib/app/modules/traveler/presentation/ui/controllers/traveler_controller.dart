import 'package:flutter/material.dart';

import '../../../domain/entities/traveler_entity.dart';
import '../../../domain/usecases/add_traveler_usecase.dart';
import '../../../domain/value_objects/package_size.dart';
import '../../../domain/value_objects/package_weight.dart';
import '../../../domain/value_objects/transport_types.dart';
import '../states/traveler_states.dart';

class TravelerController extends ValueNotifier<TravelerState> {
  final IAddTravelerUseCase addTravelerUseCase;

  TravelerController({required this.addTravelerUseCase})
      : super(TravelerSuccessState());

  TextEditingController dataControllerStart = TextEditingController(text: '');
  TextEditingController dataControllerEnd = TextEditingController(text: '');
  TextEditingController dataControllerCitySource =
      TextEditingController(text: 'Campo Grande, MS');
  TextEditingController dataControllerCityDestiny =
      TextEditingController(text: 'Dourados, MS');
  TextEditingController priceTextController =
      TextEditingController(text: '100,00');

  TransportTypes? transportType = TransportTypes.car;
  ValueNotifier<PackageSize?> packageSize =
      ValueNotifier<PackageSize?>(PackageSize.none);

  ValueNotifier<PackageWeight?> packageWeight =
      ValueNotifier<PackageWeight>(PackageWeight.none);
  var price = ValueNotifier<double>(100.00);

  late TravelerEntity traveler;

  void setTransportType(TransportTypes? value) {
    transportType = value;
  }

  void setPackageSize(PackageSize? value) {
    packageSize.value = value;
  }

  void setPackageWeight(PackageWeight? value) {
    packageWeight.value = value;
  }

  void setDeliveryPrice(double value) {
    price.value = value;
    priceTextController.text = value.toStringAsFixed(2);
  }

  void setTravelerEntity() {
    traveler = TravelerEntity(
      arrivalDate: DateTime.parse(
          dataControllerStart.text.replaceAll('/', '-') + ' 00:00:00.000'),
      departureDate: DateTime.parse(
          dataControllerEnd.text.replaceAll('/', '-') + ' 00:00:00.000'),
      destinationCity: dataControllerCityDestiny.text,
      originCity: dataControllerCitySource.text,
      packageSize: packageSize.value,
      packageWeight: packageWeight.value,
      transportType: transportType!,
      value: price.value,
      uid: '',
      uidUser: '',
    );
  }

  Future<void> addTraverler() async {
    try {
      value = TravelerLoadingState();

      await addTravelerUseCase.call(traveler);
      value = TravelerSuccessState();
    } catch (e) {
      value = TravelerErrorState();
    }
    notifyListeners();
  }

  void reset() {
    value = TravelerFilledInState();
    dataControllerStart = TextEditingController(text: '');
    dataControllerEnd = TextEditingController(text: '');
    dataControllerCitySource = TextEditingController(text: 'Campo Grande, MS');
    dataControllerCityDestiny = TextEditingController(text: 'Dourados, MS');
    priceTextController = TextEditingController(text: '100,00');
    price = ValueNotifier<double>(100.00);
  }
}
