part of '../viewmodels.dart';

class HomeViewmodel extends FutureViewModel<void> {
  
  @override
  Future<void> futureToRun() => init();

  Future<void> init() async {

  }

}

//--------------------------
// Home Bottom Navigation
//--------------------------
class HomeNav extends IndexTrackingViewModel {}