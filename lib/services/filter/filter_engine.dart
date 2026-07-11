import '../../models/ride_model.dart';

import '../../models/settings_model.dart';





class FilterEngine {





static bool checkRide(

RideModel ride,

SettingsModel settings,

){



// Auto Accept OFF है तो reject

if(!settings.autoAccept){


return false;


}







// Minimum fare check

if(ride.fare < settings.minimumFare){


return false;


}







// Distance limit check

if(ride.distance > settings.maximumDistance){


return false;


}







// ₹ per KM check

if(ride.earningPerKm < settings.minimumPerKm){


return false;


}







return true;



}






}
