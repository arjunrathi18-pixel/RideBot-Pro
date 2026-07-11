import 'package:flutter/services.dart';

import '../../models/ride_model.dart';
import '../../services/filter/filter_engine.dart';
import '../../models/settings_model.dart';


class AutomationService {



static const channel =
MethodChannel(
'ridebot/automation'
);





static void start(){



channel.setMethodCallHandler(

(call) async{


if(call.method=="ride_detected"){


final data =
call.arguments;



final ride =
RideModel(

platform:"Unknown",

fare:data["fare"],

distance:data["distance"],

earningPerKm:
data["fare"] /
data["distance"],

pickup:data["pickup"],

dropLocation:"",

status:"DETECTED",

createdAt:
DateTime.now()

);



// next step:
// save in database
// apply filters



}


return null;
  final settings = SettingsModel(

autoAccept:true,

minimumFare:100,

minimumPerKm:12,

maximumDistance:40,

);
  bool accepted =
FilterEngine.checkRide(

ride,

settings

);
  if(accepted){


print(
"Ride Accepted"
);


// आगे Auto Click Function आएगा


}

else{


print(
"Ride Rejected"
);


}


}


);



}



}
