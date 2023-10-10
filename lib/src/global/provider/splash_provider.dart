import 'package:beacons_school/src/global/services/shared_preferences_local.dart';
import 'package:flutter/material.dart';

enum SplashStatus {
  checking,
  initial,
  admin,
  parents,
  initialAdmin,
  initialParents,
  login
}

class SplashProvider extends ChangeNotifier {
  SplashStatus _splashStatus = SplashStatus.checking;
  SplashStatus get splashStatus => _splashStatus;
  set splashStatus(SplashStatus value) {
    _splashStatus = value;
    notifyListeners();
  }

  SplashProvider() {
    isAuthenticated();
  }

  Future isAuthenticated() async {
    int statusSplash = SharedPrefsLocal.statusSplash;
    if (statusSplash == 0) {
      splashStatus = SplashStatus.initial;
    }
    if (statusSplash == 1) {
      splashStatus = SplashStatus.login;
    }
    if (statusSplash == 2) {
      splashStatus = SplashStatus.initialAdmin;
    }
    if (statusSplash == 3) {
      splashStatus = SplashStatus.admin;
    }
    if (statusSplash == 4) {
      splashStatus = SplashStatus.initialParents;
    }
    if (statusSplash == 5) {
      splashStatus = SplashStatus.parents;
    }
    notifyListeners();
  }
}
