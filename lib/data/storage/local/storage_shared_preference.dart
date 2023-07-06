import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageSharedPreference {

  static SharedPreferences? _prefInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefInstance ??= await SharedPreferences.getInstance();

  static Future<SharedPreferences?> init() async {
    _prefInstance = await _instance;
    return _prefInstance;
  }

    static String getString(String key, [String? defValue]) {
    return _prefInstance?.getString(key) ?? defValue ?? '';
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefInstance?.getBool(key) ?? defValue!;
  }

  static Future<bool> setString(String key, String value) async {
    var pref = await _instance;
    return pref.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    var pref = await _instance;
    return pref.setBool(key, value);
  }

  static clear() async {
    await _prefInstance?.clear();
  }

  static bool? getBoolFirstRunApp(String key, [bool? defValue]) {
    return _prefInstance?.getBool(key);
  }
  
}