import 'package:shared_preferences/shared_preferences.dart';


import '../../models/settings_model.dart';





class SettingsDatabase {



static SharedPreferences? _prefs;







static Future<void> initialize() async {



_prefs = await SharedPreferences.getInstance();



}








static SharedPreferences get prefs {



if(_prefs == null){



throw Exception(

"SettingsDatabase not initialized"

);



}



return _prefs!;



}









static SettingsModel getSettings(){



return SettingsModel(



autoAccept:

prefs.getBool(

"autoAccept"

) ?? false,





minimumFare:

prefs.getDouble(

"minimumFare"

) ?? 100,





minimumPerKm:

prefs.getDouble(

"minimumPerKm"

) ?? 12,





maximumDistance:

prefs.getDouble(

"maximumDistance"

) ?? 40,





acceptDelay:

prefs.getInt(

"acceptDelay"

) ?? 2,





);



}









static Future<void> saveSettings(

SettingsModel settings

) async {



await prefs.setBool(

"autoAccept",

settings.autoAccept,

);





await prefs.setDouble(

"minimumFare",

settings.minimumFare,

);





await prefs.setDouble(

"minimumPerKm",

settings.minimumPerKm,

);





await prefs.setDouble(

"maximumDistance",

settings.maximumDistance,

);





await prefs.setInt(

"acceptDelay",

settings.acceptDelay,

);



}









static Future<void> reset() async {



await prefs.clear();



}



}
