import 'package:flutter/services.dart';

import '../../models/ride_model.dart';



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


}


);



}



}
