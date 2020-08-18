// ---------------
// Barrel File
// ---------------

// ----------------
// Import package
// ----------------
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

// --------
// Child
// --------
part 'krl_service.dart';

// ---------------------------------------------------------------------
// Add new service here. Then run command
// "flutter pub run build_runner build --delete-conflicting-outputs"
// ---------------------------------------------------------------------
@module
abstract class ServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  SnackbarService get snackbarService;
}
