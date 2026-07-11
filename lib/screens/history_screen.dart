import 'package:flutter/material.dart';

import '../data/database/ride_database.dart';

import '../models/ride_model.dart';





class HistoryScreen extends StatefulWidget {


const HistoryScreen({

super.key

});





@override

State<HistoryScreen> createState()

=> _HistoryScreenState();



}








class _HistoryScreenState

extends State<HistoryScreen>{



List<RideModel> rides = [];

bool loading = true;








@override

void initState(){



super.initState();

loadRides();



}








Future<void> loadRides() async {



final data =

await RideDatabase.getAcceptedRides();



setState((){



rides = data;

loading = false;



});



}








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

loading

?

const Center(

child:

CircularProgressIndicator(),

)

:

rides.isEmpty

?

const Center(



child:

Column(



mainAxisAlignment:

MainAxisAlignment.center,



children:[



Icon(

Icons.history,

size:80,

),



SizedBox(

height:15,

),



Text(

"No accepted rides yet",

style:

TextStyle(

fontSize:18,

),

),



],



),



)

:

RefreshIndicator(



onRefresh:

loadRides,



child:

ListView.builder(



padding:

const EdgeInsets.all(16),



itemCount:

rides.length,



itemBuilder:

(context,index){



final ride = rides[index];





return Card(



margin:

const EdgeInsets.only(

bottom:12

),



child:

ListTile(



leading:

CircleAvatar(



child:

Icon(

Icons.directions_car,

),

),





title:

Text(

"₹${ride.fare.toStringAsFixed(0)}",

style:

const TextStyle(

fontWeight:

FontWeight.bold,

fontSize:18,

),

),





subtitle:

Column(



crossAxisAlignment:

CrossAxisAlignment.start,



children:[





Text(

"${ride.distance.toStringAsFixed(1)} KM"

),





Text(

ride.pickup,

maxLines:1,

overflow:

TextOverflow.ellipsis,

),





Text(

formatDate(

ride.createdAt

),

),





],



),






trailing:

const Icon(

Icons.check_circle,

),



),



);



},



),



),



);



}








String formatDate(DateTime date){



return

"${date.day}/${date.month}/${date.year} "

"${date.hour}:${date.minute.toString().padLeft(2,'0')}";



}



}
