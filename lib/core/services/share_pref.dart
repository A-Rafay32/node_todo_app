import "package:node_todo_app/app/constants/prefs_keys.dart";
import "package:shared_preferences/shared_preferences.dart";

class UserPrefs {
  static SharedPreferences? _pref;
  static Future init() async => _pref = await SharedPreferences.getInstance();

  /////////////////////////////////[ User ]///////////////////////////////////////////////////////////////////////

  static Future setUserSession(bool value) async {
    try {
      await _pref
          ?.setBool(PrefKeys.userSessionKey, value)
          .catchError((error) => throw error);
    } catch (e) {
      return e;
    }
  }

  static Future<bool?> getUserSession() async {
    bool? value = await _pref?.getBool(PrefKeys.userSessionKey);
    return value;
  }

  static Future setUserInfo(String value) async {
    try {
      await _pref
          ?.setString(PrefKeys.userKey, value)
          .catchError((error) => throw error);
    } catch (e) {
      return e;
    }
  }

  static Future<String?> getUserInfo(String value) async {
    String? value = await _pref?.getString(PrefKeys.userKey);
    return value;
  }

/////////////////////////////////[ List ]///////////////////////////////////////////////////////////////////////

  static Future setList(List<String> list) async {
    await _pref?.setStringList(PrefKeys.listKey, list);
  }

  static List<String>? getList() {
    return _pref?.getStringList(PrefKeys.listKey);
  }

  static Future deleteList() async {
    await _pref?.remove(PrefKeys.listKey);
  }

  static Future deleteItemFromList(String word) async {
    List<String> temp = _pref?.getStringList(PrefKeys.listKey) as List<String>;
    temp.remove(word);
    await _pref?.setStringList(PrefKeys.listKey, temp);
  }
}
