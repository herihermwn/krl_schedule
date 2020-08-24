part of 'services.dart';

class SharedPreferenceService {
  final storage = FlutterSecureStorage();

  Future<void> saveToPref({String value, String key}) async {
    await storage.write(key: key, value: value);
  }

  Future<void> deleteFromPref(String key) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAllFromPref() async {
    await storage.deleteAll();
  }

  Future<String> getFromPref(String key) async {
    String value = await storage.read(key: key);
    if (value != null) {
      return value;
    } else {
      return null;
    }
  }
}
