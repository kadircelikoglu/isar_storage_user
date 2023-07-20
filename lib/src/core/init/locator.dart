import 'package:get_it/get_it.dart';
import 'package:user_details/src/core/base/services/user_service.dart';
import 'package:user_details/src/view/users/provider/user_provider.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserService());
  locator.registerFactory(() => UserProvider());
}
