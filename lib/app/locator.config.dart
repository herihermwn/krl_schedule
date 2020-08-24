// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/service/services.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final servicesModule = _$ServicesModule();
  gh.lazySingleton<DialogService>(() => servicesModule.dialogService);
  gh.lazySingleton<KRLService>(() => servicesModule.kRLService);
  gh.lazySingleton<NavigationService>(() => servicesModule.navigationService);
  gh.lazySingleton<SharedPreferenceService>(
      () => servicesModule.sharedPrefService);
  gh.lazySingleton<SnackbarService>(() => servicesModule.snackbarService);
  return get;
}

class _$ServicesModule extends ServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  KRLService get kRLService => KRLService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SharedPreferenceService get sharedPrefService => SharedPreferenceService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
