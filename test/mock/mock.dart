import 'package:mocktail/mocktail.dart';
import 'package:muvver_app/app/modules/traveler/domain/entities/traveler_entity.dart';
import 'package:muvver_app/app/modules/traveler/domain/repositories/traveler_repository_interface.dart';
import 'package:muvver_app/app/modules/traveler/domain/value_objects/transport_types.dart';
import 'package:muvver_app/app/modules/traveler/infra/datasource/traveler_datasource_interface.dart';

class ITravelerRepositoryMock extends Mock implements ITravelerRepository {}

class TravelerEntityMock extends Mock implements TravelerEntity {}

class ITravelerDataSourceMock extends Mock implements ITravelerDatasource {}

final travelerEntityMock = TravelerEntityMock();

final travelerEntityTest = TravelerEntity(
  arrivalDate: DateTime.now(),
  departureDate: DateTime.now(),
  destinationCity: '',
  originCity: '',
  packageSize: null,
  packageWeight: null,
  transportType: TransportTypes.airplane,
  uid: '',
  uidUser: '',
  value: 2000,
);
