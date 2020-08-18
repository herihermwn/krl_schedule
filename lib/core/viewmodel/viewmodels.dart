// ---------------
// Barrel File
// ---------------

// ----------------
// Import package
// ----------------
import 'package:flutter/material.dart';
import 'package:krl_schedule/app/locator.dart';
import 'package:krl_schedule/ui/shared/shareds.dart';
import 'package:package_info/package_info.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// --------
// Child
// --------
part 'splash_viewmodel.dart';

// ----------
// Service
// ----------
final _navigationService = locator<NavigationService>();
final _snackbarService = locator<SnackbarService>();

// ----------------
// Navigator Key
// ----------------
GlobalKey<NavigatorState> _snackbarKey = _snackbarService.navigatorKey;
