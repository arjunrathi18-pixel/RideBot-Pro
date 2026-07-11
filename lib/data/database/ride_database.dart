import 'package:hive_flutter/hive_flutter.dart';


import '../../models/ride_model.dart';





class RideDatabaseService {



static const String rideBoxName =

"ride_history";








static Future<void> initialize() async {



if(!Hive.isBoxOpen(rideBoxName)){


await Hive.openBox<RideModel>(

rideBoxName

);


}



}









static Box<RideModel> get _rideBox =>


Hive.box<RideModel>(

rideBoxName

);









static Future<void> saveRide(

RideModel ride

) async {



await _rideBox.add(

ride

);



}









static List<RideModel> getAllRides(){



return _rideBox.values.toList().reversed.toList();



}









static List<RideModel> getAcceptedRides(){



return _rideBox.values

.where(

(ride)=>


ride.status == "ACCEPTED"


)

.toList();



}









static double getTotalEarning(){



double total = 0;



for(final ride in _rideBox.values){



if(ride.status == "ACCEPTED"){


total += ride.fare;


}



}



return total;



}









static int getTotalRides(){



return _rideBox.length;



}









static Future<void> clearHistory() async {



await _rideBox.clear();



}



}
