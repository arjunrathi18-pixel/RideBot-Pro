import 'package:hive_flutter/hive_flutter.dart';


import '../../models/settings_model.dart';





class SettingsDatabase {



static const String boxName =

"settings";







static Future<void> initialize() async {



if(!Hive.isBoxOpen(boxName)){


await Hive.openBox<SettingsModel>(

boxName

);


}


}








static Box<SettingsModel> get _box =>


Hive.box<SettingsModel>(boxName);









static SettingsModel getSettings(){



if(_box.isEmpty){


return SettingsModel();


}



return _box.getAt(0)!;



}









static Future<void> saveSettings(

SettingsModel settings

) async {



await _box.put(

0,

settings

);



}






static Future<void> clear() async{


await _box.clear();


}



}
