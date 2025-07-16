import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences{
  static late SharedPreferences _preferences;
  static Future init()async => _preferences = await SharedPreferences.getInstance();

  static String primaryColorString = "primColor";
  static String secondaryColorString = "secondaryColorString";
  static String darkMode = "darkMode";
  static String emailKey = "EmailKy";
  static String userNameKey = "usernameKy";
  static String passwordKey = "passwordKey";
  static String expTokenTimeKey = "expTokenTimeKey";
  static String userTokenKey = "expToken";
  static String biometricRegisteredKey = "biometricRegisteredKey";
  static String showBiometricPopupKey = "showBiometricPopupKey";

  static Future setBioRegistered(bool registeredValue) => _preferences.setBool(biometricRegisteredKey, registeredValue);
  static bool? getBioRegistered() => _preferences.getBool(biometricRegisteredKey)??false;

  static Future setBioPopupValue(bool showPopUp) => _preferences.setBool(showBiometricPopupKey, showPopUp);
  static bool getBioPopupValue() => _preferences.getBool(showBiometricPopupKey)??false;

  static Future setIsDarkMode(bool isDarkMode) => _preferences.setBool(darkMode, isDarkMode);
  static bool? getIsDarkMode() => _preferences.getBool(darkMode)??false;

  static  Future setPrimaryColor(String value) async => _preferences.setString(primaryColorString, value);
  static String getPrimaryColor() => _preferences.getString(primaryColorString)??"0xffFC695A";

  static  Future setSecondaryColor(String value) async => _preferences.setString(secondaryColorString, value);
  static String getSecondaryColor() => _preferences.getString(secondaryColorString)??"0x66EA580C";

  static Future setEmail(String email) => _preferences.setString(emailKey, email);
  static String? getEmail() => _preferences.getString(emailKey);

  static Future setUserName(String username) => _preferences.setString(userNameKey, username);
  static String? getUsername() => _preferences.getString(userNameKey);

  static Future setPassword(String password) => _preferences.setString(passwordKey, password);
  static String? getPassword() => _preferences.getString(passwordKey);

  static Future setExpTime(String time) => _preferences.setString(expTokenTimeKey, time);
  static String? getExpTime() => _preferences.getString(expTokenTimeKey);

  static Future setUserToken(String token) => _preferences.setString(userTokenKey, token);
  static String getUserToken() => _preferences.getString(userTokenKey)??"";


  static void clearSpecificPreferences() {
    _preferences.remove(userTokenKey);
    _preferences.remove(expTokenTimeKey);
  }


}