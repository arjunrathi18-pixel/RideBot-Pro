import '../../models/settings_model.dart';
import '../../models/ride_model.dart';



class FilterEngine {



static bool checkRide(

RideModel ride,

SettingsModel settings

){



// Auto Accept Disabled

if(!settings.autoAccept){

return false;

}



// Minimum Fare Check

if(ride.fare < settings.minimumFare){

return false;

}



// Distance Check

if(
ride.distance >
settings.maximumDistance

){

return false;

}



// Per KM Check

if(
ride.earningPerKm <
settings.minimumPerKm

){

return false;

}



return true;


}





}
