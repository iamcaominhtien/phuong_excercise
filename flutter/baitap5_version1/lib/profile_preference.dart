import 'dart:convert';

import 'package:baitap5_version1/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePreference {
  static const String _key = 'profile';

  static Future<Profile> readPreference() async {
    var prefs = await SharedPreferences.getInstance();
    var jsonString = prefs.getString(_key);
    if (jsonString != null && jsonString.isNotEmpty) {
      Map<String, dynamic> jsonData = json.decode(jsonString);
      print("load data success");
      return Profile.fromJson(jsonData);
    }
    var defaultProfile = Profile.createDefaultProfile();
    print('load default profile');
    await saveData(defaultProfile);
    return defaultProfile;
  }

  static Future<void> saveData(Profile profile) async {
    var prefs = await SharedPreferences.getInstance();
    var jsonString = json.encode(profile.toJson());
    await prefs.setString(_key, jsonString);
    print('save data success');
  }
}
