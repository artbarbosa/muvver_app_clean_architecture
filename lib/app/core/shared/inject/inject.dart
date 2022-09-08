import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../modules/traveler/domain/repositories/traveler_repository_interface.dart';
import '../../../modules/traveler/domain/usecases/add_traveler_usecase.dart';
import '../../../modules/traveler/external/datasources/traveler_datadource.dart';
import '../../../modules/traveler/infra/datasource/traveler_datasource_interface.dart';
import '../../../modules/traveler/infra/repositories/traveler_repository.dart';
import '../../../modules/traveler/presentation/ui/controllers/traveller_controller.dart';
import '../services/remote/http_client_mock.dart';
import '../services/remote/http_client_service_interface.dart';
import '../ui/controllers/custom_bottom_navigation_bar_controller.dart';

class Inject {
  static initialize() {
    final getIt = GetIt.I;

    getIt.registerLazySingleton<IHttpService>(() => HttpClientMock());

    getIt.registerLazySingleton<ITravelerRepository>(
        () => TravelerRepository(datasource: getIt()));

    getIt.registerLazySingleton<ITravelerDatasource>(
        () => TravelerDatasource(getIt()));

    getIt.registerLazySingleton<IAddTravelerUseCase>(
        () => AddTravelerUseCase(getIt()));

    getIt.registerLazySingleton<TravellerController>(
      () => TravellerController(addTravelerUseCase: getIt()),
    );
    getIt.registerLazySingleton<CustomBottomNavigationBarController>(
      () => CustomBottomNavigationBarController(0, PageController()),
    );
  }
}
