import '../../models/ride_model.dart';
import '../../models/settings_model.dart';





class FilterEngine {



static bool checkRide(

RideModel ride,

SettingsModel settings

){





if(ride.fare < settings.minimumFare){

return false;

}







if(ride.distance > settings.maximumDistance){

return false;

}







if(ride.distance <= 0){

return false;

}







final perKm =

ride.fare / ride.distance;






if(perKm < settings.minimumPerKm){

return false;

}







return true;



}



}
