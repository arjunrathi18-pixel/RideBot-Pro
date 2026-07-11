import 'package:flutter/material.dart';


import '../data/database/ride_database.dart';

import '../models/ride_model.dart';





class HistoryScreen extends StatelessWidget {



const HistoryScreen({

super.key

});







@override

Widget build(BuildContext context){



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

FutureBuilder<List<RideModel>>(



future:

RideDatabase.getAllRides(),




builder:

(context, snapshot){



if(snapshot.connectionState ==

ConnectionState.waiting){



return const Center(

child:

CircularProgressIndicator(),

);



}






if(!snapshot.hasData ||

snapshot.data!.isEmpty){



return const Center(

child:

Text(

"No rides found"

),

);



}







final rides =

snapshot.data!;








return ListView.builder(



padding:

const EdgeInsets.all(16),



itemCount:

rides.length,



itemBuilder:

(context,index){



return _rideCard(

rides[index]

);



},



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

bottom:12,

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

FontWeight.bold,

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

height:10,

),






Text(

"Fare : ₹${ride.fare.toStringAsFixed(2)}"

),





Text(

"Distance : ${ride.distance} KM"

),





Text(

"Earning/KM : ₹${ride.earningPerKm.toStringAsFixed(2)}"

),





Text(

"Pickup : ${ride.pickup}"

),





Text(

"Status : ${ride.status}"

),






Text(

ride.createdAt.toString(),

style:

const TextStyle(

fontSize:12,

),

),





],



),



),



);



}



}
