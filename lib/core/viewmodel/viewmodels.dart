// ---------------
// Barrel File
// ----------------
// Import package
// ----------------
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:krl_schedule/app/locator.dart';
import 'package:krl_schedule/core/model/models.dart';
import 'package:krl_schedule/core/service/services.dart';
import 'package:krl_schedule/ui/page/pages.dart';
import 'package:krl_schedule/ui/shared/shareds.dart';
import 'package:package_info/package_info.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// --------
// Child
// --------
part 'splash_viewmodel.dart';
part 'user_profilling_viewmodel.dart';
part 'tambah_stasiun_viewmodel.dart';
part 'cari_stasiun_viewmodel.dart';

// ----------
// Service
// ----------
final _navigationService = locator<NavigationService>();
final _snackbarService = locator<SnackbarService>();
final _krlService = locator<KRLService>();

// ----------------
// Navigator Key
// ----------------
GlobalKey<NavigatorState> _snackbarKey = _snackbarService.navigatorKey;
