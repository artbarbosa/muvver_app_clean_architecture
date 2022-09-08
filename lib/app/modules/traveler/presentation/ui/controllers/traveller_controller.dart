import 'package:flutter/material.dart';

import '../../../domain/entities/traveler_entity.dart';
import '../../../domain/usecases/add_traveler_usecase.dart';
import '../../../domain/value_objects/package_size.dart';
import '../../../domain/value_objects/package_weight.dart';
import '../../../domain/value_objects/transport_types.dart';

class TravellerController {
  final IAddTravelerUseCase addTravelerUseCase;

  TravellerController({required this.addTravelerUseCase});

  TextEditingController dataControllerStart = TextEditingController(text: '');
  TextEditingController dataControllerEnd = TextEditingController(text: '');
  TextEditingController dataControllerCitySource =
      TextEditingController(text: 'Campo Grande, MS');
  TextEditingController dataControllerCityDestiny =
      TextEditingController(text: 'Dourados, MS');
  TextEditingController priceTextController =
      TextEditingController(text: '100,00');

  TransportTypes? transportType = TransportTypes.car;
  PackageSize? packageSize = PackageSize.none;
  ValueNotifier<PackageWeight?> packageWeight =
      ValueNotifier<PackageWeight>(PackageWeight.none);
  var price = ValueNotifier<double>(100.00);

  void setTransportType(TransportTypes? value) {
    transportType = value;
  }

  void setPackageSize(PackageSize? value) {
    packageSize = value;
  }

  void setPackageWeight(PackageWeight? value) {
    packageWeight.value = value;
  }

  void setDeliveryPrice(double value) {
    price.value = value;
    priceTextController.text = value.toStringAsFixed(2);
  }

  void addTraverler() {
    addTravelerUseCase.call(TravelerEntity(
      arrivalDate: DateTime.parse(dataControllerStart.text),
      departureDate: DateTime.parse(dataControllerEnd.text),
      destinationCity: dataControllerCityDestiny.text,
      originCity: dataControllerCitySource.text,
      packageSize: packageSize,
      packageWeight: packageWeight.value,
      transportType: transportType!,
      value: price.value,
      uid: '',
      uidUser: '',
    ));
  }

  void reset() {
    dataControllerStart = TextEditingController(text: '');
    dataControllerEnd = TextEditingController(text: '');
    dataControllerCitySource = TextEditingController(text: 'Campo Grande, MS');
    dataControllerCityDestiny = TextEditingController(text: 'Dourados, MS');
    priceTextController = TextEditingController(text: '100,00');
    price = ValueNotifier<double>(100.00);
  }
}
