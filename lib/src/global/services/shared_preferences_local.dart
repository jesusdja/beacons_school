import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsLocal {

  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static int get statusSplash => prefs.getInt("statusSplash") ?? 0;
  static set statusSplash(int value) => prefs.setInt("statusSplash", value);

  static String get schoolName1 => prefs.getString("SchoolName1") ?? '';
  static set schoolName1(String value) => prefs.setString("SchoolName1", value);

  static String get schoolName2 => prefs.getString("SchoolName2") ?? '';
  static set schoolName2(String value) => prefs.setString("SchoolName2", value);

  static String get schoolIdParents => prefs.getString("SchoolIdParents") ?? '';
  static set schoolIdParents(String value) => prefs.setString("SchoolIdParents", value);

}
