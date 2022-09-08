import '../value_objects/package_size.dart';
import '../value_objects/package_weight.dart';
import '../value_objects/transport_types.dart';

class TravelerEntity {
  final String uid;
  final String uidUser;
  final TransportTypes transportType;
  final DateTime departureDate;
  final DateTime arrivalDate;
  final String originCity;
  final String destinationCity;
  final PackageSize? packageSize;
  final PackageWeight? packageWeight;
  final double value;

  TravelerEntity({
    required this.uid,
    required this.uidUser,
    required this.transportType,
    required this.departureDate,
    required this.arrivalDate,
    required this.originCity,
    required this.destinationCity,
    required this.packageSize,
    required this.packageWeight,
    required this.value,
  });
}
