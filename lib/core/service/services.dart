// ---------------
// Barrel File
// ----------------
// Import package
// ----------------
import 'package:dio/dio.dart';
// Conflict dio and flutter secure storage
// ignore: implementation_imports
import 'package:dio/src/options.dart' as dioOptions;
import 'package:injectable/injectable.dart';
import 'package:krl_schedule/core/model/models.dart';
import 'package:krl_schedule/ui/shared/shareds.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// --------
// Child
// --------
part 'krl_service.dart';
part 'shared_preference_service.dart';

/// ---------------------------------------------------------------------
/// Add new service here. Then run command
/// "flutter pub run build_runner build --delete-conflicting-outputs"
/// ---------------------------------------------------------------------
@module
abstract class ServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  SnackbarService get snackbarService;
  @lazySingleton
  KRLService get kRLService;
  @lazySingleton
  SharedPreferenceService get sharedPrefService;
}
