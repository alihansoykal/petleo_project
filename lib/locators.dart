import 'package:get_it/get_it.dart';

import 'services/pet_data_service.dart';

GetIt locator = GetIt.I;

void setupLocators() {
  locator.registerLazySingleton<PetDataService>(
    () => PetDataService(),
  );
}
