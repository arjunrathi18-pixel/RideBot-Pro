import 'package:flutter/services.dart';


import '../../models/ride_model.dart';

import '../../models/settings_model.dart';


import '../filter/filter_engine.dart';


import '../../data/database/ride_database.dart';


import '../notifications/notification_service.dart';






class AutomationService {



static const MethodChannel _channel =

const MethodChannel(

'ridebot/automation'

);









static Future<void> initialize(

SettingsModel settings

) async {



_channel.setMethodCallHandler(

(call) async {



if(call.method == "ride_detected"){



final data =

Map<String,dynamic>.from(

call.arguments

);





final ride = RideModel(



platform:

"Auto Ride",



fare:

(data["fare"] ?? 0)

.toDouble(),



distance:

(data["distance"] ?? 0)

.toDouble(),



earningPerKm:



(data["fare"] ?? 0)

.toDouble()

/

((data["distance"] ?? 1)

.toDouble()),



pickup:

data["pickup"] ?? "",



dropLocation:

"",



status:

"DETECTED",



createdAt:

DateTime.now(),



);






await NotificationService.rideDetected(

ride.fare,

ride.distance,

);







final accepted =

FilterEngine.checkRide(

ride,

settings,

);






if(accepted){



await RideDatabase.saveRide(



ride.copyWith(

status:

"ACCEPTED",

),



);





await NotificationService.rideAccepted();



await acceptRide();



}

else{



await RideDatabase.saveRide(



ride.copyWith(

status:

"REJECTED",

),



);



await NotificationService.rideRejected();



}



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
