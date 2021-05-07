import 'package:application_architecture/core/constants/enum/locale_keys_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  static LocaleManager? _instance;
  SharedPreferences? _sharedPreferences;
  static LocaleManager get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = LocaleManager._init();
      return _instance!;
    }
  }

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) => _sharedPreferences = value);
  }

  static preferencesInit() async {
    if (instance._sharedPreferences == null) {
      instance._sharedPreferences = await SharedPreferences.getInstance();
    }
    return;
  }

  // Setter Methods
  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _sharedPreferences!.setString(key.toString(), value);
  }

  Future<void> setIntValue(PreferencesKeys key, int value) async {
    await _sharedPreferences!.setInt(key.toString(), value);
  }

  Future<void> setDoubleValue(PreferencesKeys key, double value) async {
    await _sharedPreferences!.setDouble(key.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _sharedPreferences!.setBool(key.toString(), value);
  }

  // Getter Methods
  String getStringValue(PreferencesKeys key) =>
      _sharedPreferences!.getString(key.toString()) ?? '';

  int getIntValue(PreferencesKeys key) =>
      _sharedPreferences!.getInt(key.toString()) ?? 0;

  double getDoubleValue(PreferencesKeys key) =>
      _sharedPreferences!.getDouble(key.toString()) ?? 0.0;

  bool getBoolValue(PreferencesKeys key) =>
      _sharedPreferences!.getBool(key.toString()) ?? false;
}
