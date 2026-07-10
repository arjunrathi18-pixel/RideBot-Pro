import 'package:hive_flutter/hive_flutter.dart';


import '../../models/ride_model.dart';
import '../../models/settings_model.dart';



class RideDatabase {



static const String rideBox =
"rides";


static const String settingsBox =
"settings";





static Future<void> init() async{


await Hive.openBox<RideModel>(
rideBox
);


await Hive.openBox<SettingsModel>(
settingsBox
);



}







static Box<RideModel> get rides =>

Hive.box<RideModel>(
rideBox
);





static Box<SettingsModel> get settings =>

Hive.box<SettingsModel>(
settingsBox
);







static Future<void> addRide(
RideModel ride
) async{


await rides.add(
ride
);


}





static List<RideModel> getAllRides(){


return rides.values.toList();


}





static Future<void> saveSettings(
SettingsModel model
) async{


await settings.put(
0,
model
);


}





static SettingsModel getSettings(){


if(settings.isEmpty){


return SettingsModel();


}


return settings.getAt(0)!;


}





}
