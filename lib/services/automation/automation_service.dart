import 'package:flutter/services.dart';


import '../../models/ride_model.dart';

import '../../models/settings_model.dart';

import '../filter/filter_engine.dart';

import '../database/ride_database_service.dart';





class AutomationService {



static const MethodChannel _channel =

    MethodChannel(
      'ridebot/automation'
    );







static Future<void> initialize(

SettingsModel settings

) async {



_channel.setMethodCallHandler(

(call) async {



switch(call.method){



case "ride_detected":



final data =

call.arguments;



final ride =

RideModel(


platform:

"Detected App",



fare:

(data["fare"] ?? 0)

.toDouble(),



distance:

(data["distance"] ?? 0)

.toDouble(),



earningPerKm:


(data["fare"] ?? 0)

/

(data["distance"] ?? 1),



pickup:

data["pickup"] ?? "",



dropLocation:

"",



status:

"DETECTED",



createdAt:

DateTime.now(),



);





bool accepted =

FilterEngine.checkRide(

ride,

settings

);





if(accepted){



await acceptRide();



await RideDatabaseService.saveRide(

ride.copyWith(

status:

"ACCEPTED"

)

);



}

else{



await RideDatabaseService.saveRide(

ride.copyWith(

status:

"REJECTED"

)

);



}



break;





default:

break;



}



}



);



}








static Future<void> acceptRide() async {



await _channel.invokeMethod(

"accept_ride"

);



}



}
