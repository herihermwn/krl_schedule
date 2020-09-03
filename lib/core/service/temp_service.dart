part of 'services.dart';

/// Service that save some value, so you can share value each pages
/// without parameter on class pages
class TempDataService {
  Map<String, dynamic> tempData = {};

  bool saveValue(String key, dynamic value) {
    if (checkKey(key)) {
      return false;
    } else {
      tempData[key] = value;
      return true;
    }
  }

  dynamic getValue(String key) {
    return tempData[key];
  }

  bool updateValue(String key, dynamic value) {
    bool isSucces = true;

    tempData.update(key, (value) => value, ifAbsent: () {
      isSucces = false;
    });

    return isSucces;
  }

  bool removeValue(String key) {
    if (checkKey(key)) {
      tempData.remove(key);
      return true;
    } else {
      return false;
    }
  }

  clearValue() {
    tempData.clear();
  }

  bool checkKey(String key) {
    return tempData.containsKey(key);
  }
}
