// ---------------
// Barrel File
// ----------------
// Import package
// ----------------
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:krl_schedule/app/locator.dart';
import 'package:krl_schedule/core/model/models.dart';
import 'package:krl_schedule/core/service/services.dart';
import 'package:krl_schedule/ui/page/pages.dart';
import 'package:krl_schedule/ui/shared/shareds.dart';
import 'package:package_info/package_info.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supercharged/supercharged.dart';
import 'package:intl/intl.dart';

// --------
// Child
// --------
part 'splash_viewmodel.dart';
part 'user_profilling_viewmodel.dart';
part 'cari_stasiun_viewmodel.dart';
// Home Viewmodel
part 'home/main_viewmodel.dart';
part 'home/home_viewmodel.dart';
part 'home/pengaturan_viewmodel.dart';
part 'home/pengingat_viewmodel.dart';

// ----------
// Service
// ----------
final _navigationService = locator<NavigationService>();
final _snackbarService = locator<SnackbarService>();
final _krlService = locator<KRLService>();
final _sharedPrefService = locator<SharedPreferenceService>();
final _tempData = locator<TempDataService>();

// ----------------
// Navigator Key
// ----------------
GlobalKey<NavigatorState> _snackbarKey = _snackbarService.navigatorKey;

// -----------
// Navigator
// -----------
Future<void> replacePage(Widget page) async {
  await _navigationService.replaceWithTransition(
    page,
    transition: NavigationTransition.RightToLeftWithFade,
    duration: Duration(milliseconds: 500),
  );
}

Future<void> movePage(Widget page) async {
  await _navigationService.navigateWithTransition(
    page,
    transition: NavigationTransition.RightToLeftWithFade,
    duration: Duration(milliseconds: 500),
  );
}