import 'package:flutter/material.dart';

import '../data/database/ride_database.dart';

import '../models/ride_model.dart';



class HistoryScreen extends StatelessWidget {


const HistoryScreen({
super.key
});




@override
Widget build(BuildContext context){



final rides =

RideDatabase.getAllRides();





return Scaffold(



appBar:

AppBar(

title:

const Text(

"Ride History"

),


centerTitle:true,

),





body:

rides.isEmpty

?

const Center(

child:

Text(

"No rides found"

),

)



:

ListView.builder(



padding:

const EdgeInsets.all(16),



itemCount:

rides.length,



itemBuilder:

(context,index){



final ride =

rides[index];



return _rideCard(

ride

);



},



),



);



}







Widget _rideCard(

RideModel ride

){



final accepted =

ride.status == "ACCEPTED";





return Card(



margin:

const EdgeInsets.only(

bottom:12

),



child:

Padding(

padding:

const EdgeInsets.all(16),



child:

Column(

crossAxisAlignment:

CrossAxisAlignment.start,



children:[





Row(

mainAxisAlignment:

MainAxisAlignment.spaceBetween,



children:[



Text(

ride.platform,

style:

const TextStyle(

fontWeight:

FontWeight.bold

),

),




Icon(

accepted

?

Icons.check_circle

:

Icons.cancel,

),



],



),





const SizedBox(

height:10

),





Text(

"Fare: ₹${ride.fare}"

),



Text(

"Distance: ${ride.distance} KM"

),



Text(

"₹/KM: ${ride.earningPerKm.toStringAsFixed(2)}"

),



Text(

"Pickup: ${ride.pickup}"

),





Text(

ride.createdAt.toString(),

style:

const TextStyle(

fontSize:12

),

),





],



),



),



);



}





}
