import 'package:shared_preferences/shared_preferences.dart';


import '../../models/settings_model.dart';





class SettingsDatabase {



static const String autoAcceptKey =

"autoAccept";



static const String minimumFareKey =

"minimumFare";



static const String minimumPerKmKey =

"minimumPerKm";



static const String maximumDistanceKey =

"maximumDistance";



static const String acceptDelayKey =

"acceptDelay";








static late SharedPreferences _prefs;







static Future<void> initialize() async {



_prefs =

await SharedPreferences.getInstance();



}









static SettingsModel getSettings(){



return SettingsModel(



autoAccept:

_prefs.getBool(

autoAcceptKey

) ?? false,



minimumFare:

_prefs.getDouble(

minimumFareKey

) ?? 100,



minimumPerKm:

_prefs.getDouble(

minimumPerKmKey

) ?? 12,



maximumDistance:

_prefs.getDouble(

maximumDistanceKey

) ?? 40,



acceptDelay:

_prefs.getInt(

acceptDelayKey

) ?? 2,



);



}









static Future<void> saveSettings(

SettingsModel settings

) async {



await _prefs.setBool(



autoAcceptKey,



settings.autoAccept,



);



await _prefs.setDouble(



minimumFareKey,



settings.minimumFare,



);



await _prefs.setDouble(



minimumPerKmKey,



settings.minimumPerKm,



);



await _prefs.setDouble(



maximumDistanceKey,



settings.maximumDistance,



);



await _prefs.setInt(



acceptDelayKey,



settings.acceptDelay,



);



}









static Future<void> clearSettings() async {



await _prefs.clear();



}



}
