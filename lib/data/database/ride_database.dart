import 'package:hive_flutter/hive_flutter.dart';

import '../../models/ride_model.dart';



class RideDatabase {



static const String rideBoxName = "ride_history";





static Future<void> initialize() async {


if(!Hive.isBoxOpen(rideBoxName)){


await Hive.openBox<RideModel>(

rideBoxName

);


}


}








static Box<RideModel> get _box =>


Hive.box<RideModel>(

rideBoxName

);








static Future<void> addRide(

RideModel ride

) async {



await _box.add(

ride

);



}








static Future<void> saveRide(

RideModel ride

) async {



await addRide(ride);


}








static List<RideModel> getAllRides(){


return _box.values

.toList()

.reversed

.toList();



}








static List<RideModel> getAcceptedRides(){



return _box.values

.where(

(ride)=>ride.status=="ACCEPTED"

)

.toList();



}








static double getTotalEarning(){



double total = 0;



for(final ride in _box.values){



if(ride.status=="ACCEPTED"){



total += ride.fare;



}



}



return total;



}








static int getTotalRides(){



return _box.length;



}








static Future<void> clearHistory() async {



await _box.clear();



}



}
