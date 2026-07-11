import '../../models/settings_model.dart';
import '../../models/ride_model.dart';

import '../../data/database/ride_database.dart';

import '../notifications/notification_service.dart';

import '../filter/filter_engine.dart';





class AutomationService {



static bool running = false;

static SettingsModel? _settings;







static Future<void> initialize(

SettingsModel settings

) async {



_settings = settings;

running = true;



}







static void stop(){



running = false;



}








static Future<void> processRide(

RideModel ride

) async {



if(!running || _settings == null){

return;

}






final accepted =

FilterEngine.checkRide(

ride,

_settings!

);







if(accepted){



await RideDatabase.saveRide(

ride.copyWith(

status:"ACCEPTED"

)

);



await NotificationService.rideAccepted();



}

else{



await RideDatabase.saveRide(

ride.copyWith(

status:"REJECTED"

)

);



await NotificationService.rideRejected();



}



}







}
