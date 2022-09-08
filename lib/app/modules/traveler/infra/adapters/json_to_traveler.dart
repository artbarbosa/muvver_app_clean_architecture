import 'package:muvver_app/app/modules/traveler/domain/entities/traveler_entity.dart';

class JsonToTraveler {
  static Map<String, dynamic> toMap(TravelerEntity traveler) {
    return {
      'uid': traveler.uid,
      'uidUser': traveler.uidUser,
      'transportType': traveler.transportType.toString().toUpperCase(),
      'departureDate': traveler.departureDate.toIso8601String(),
      'arrivalDate': traveler.arrivalDate.toIso8601String(),
      'originCity': traveler.originCity,
      'destinationCity': traveler.destinationCity,
      'packageSize': traveler.packageSize.toString().toUpperCase(),
      'packageWeight': traveler.packageWeight.toString().toUpperCase(),
      'value': traveler.value,
    };
  }
}
