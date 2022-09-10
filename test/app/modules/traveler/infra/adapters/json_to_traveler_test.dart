import 'package:flutter_test/flutter_test.dart';
import 'package:muvver_app/app/modules/traveler/infra/adapters/json_to_traveler.dart';

import '../../../../../mock/mock.dart';

void main() {
  test('Should convert TravlerEntity to map', () async {
    final map = JsonToTraveler.toMap(travelerEntityTest);

    expect(map['value'], 2000);
    expect(map["transportType"], "TRANSPORTTYPES.AIRPLANE");
  });
}
