import 'package:shared_preferences/shared_preferences.dart';

import 'utils.dart';

class SharedPref {
  Future<void> saveDataUser(String data) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(AppStrings.keySave, data);
  }

  Future<String?> readDataUser() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString(AppStrings.keySave);
    return data;
  }
}
