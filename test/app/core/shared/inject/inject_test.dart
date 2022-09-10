import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:muvver_app/app/core/shared/inject/inject.dart';
import 'package:muvver_app/app/core/shared/services/remote/http_client_mock.dart';
import 'package:muvver_app/app/core/shared/services/remote/http_client_service_interface.dart';
import 'package:muvver_app/app/core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';
import 'package:muvver_app/app/modules/traveler/domain/repositories/traveler_repository_interface.dart';
import 'package:muvver_app/app/modules/traveler/domain/usecases/add_traveler_usecase.dart';
import 'package:muvver_app/app/modules/traveler/external/datasources/traveler_datadource.dart';
import 'package:muvver_app/app/modules/traveler/infra/datasource/traveler_datasource_interface.dart';
import 'package:muvver_app/app/modules/traveler/infra/repositories/traveler_repository.dart';
import 'package:muvver_app/app/modules/traveler/presentation/ui/controllers/traveler_controller.dart';

void main() {
  setUpAll(() async {
    await Inject.initialize();
  });
  test('Should return Instance HttpClientMock', () async {
    final result = GetIt.I<IHttpService>();

    expect(result, isA<IHttpService>());
    expect(result, isA<HttpClientMock>());
  });
  test('Should return Instance ITravelerRepository', () async {
    final result = GetIt.I<ITravelerRepository>();

    expect(result, isA<ITravelerRepository>());
    expect(result, isA<TravelerRepository>());
  });

  test('Should return Instance ITravelerDatasource', () async {
    final result = GetIt.I<ITravelerDatasource>();

    expect(result, isA<ITravelerDatasource>());
    expect(result, isA<TravelerDatasource>());
  });

  test('Should return Instance IAddTravelerUseCase', () async {
    final result = GetIt.I<IAddTravelerUseCase>();

    expect(result, isA<IAddTravelerUseCase>());
    expect(result, isA<AddTravelerUseCase>());
  });

  test('Should return Instance TravellerController', () async {
    final result = GetIt.I<TravelerController>();

    expect(result, isA<TravelerController>());
  });

  test('Should return Instance CustomBottomNavigationBarController', () async {
    final result = GetIt.I<CustomBottomNavigationBarController>();

    expect(result, isA<CustomBottomNavigationBarController>());
  });
}
