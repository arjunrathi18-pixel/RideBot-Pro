import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../services/app_state_provider.dart';

import '../data/database/ride_database.dart';




class DashboardScreen extends StatelessWidget {


const DashboardScreen({
super.key
});





@override
Widget build(BuildContext context){



final app =

context.watch<AppStateProvider>();




final totalRides =

RideDatabase.getTotalRides();



final totalEarning =

RideDatabase.getTotalEarning();



final acceptedRides =

RideDatabase.getAcceptedRides().length;





return Scaffold(



appBar:

AppBar(

title:

const Text(

"RideBot Pro Dashboard"

),


centerTitle: true,

),






body:

RefreshIndicator(



onRefresh: () async{


},

child:

ListView(



padding:

const EdgeInsets.all(16),



children:[





Card(

child:

Padding(

padding:

const EdgeInsets.all(20),



child:

Column(

children:[



Icon(

app.automationRunning

?

Icons.play_circle

:

Icons.pause_circle,



size:

60,

),




const SizedBox(

height:10

),





Text(

app.automationRunning

?

"Automation Running"

:

"Automation Stopped",



style:

const TextStyle(

fontSize:20,

fontWeight:FontWeight.bold

),



),



],



),


),



),





const SizedBox(

height:16

),






Row(



children:[



Expanded(

child:

_dashboardCard(

"Total Rides",

"$totalRides",

Icons.motorcycle

),

),




const SizedBox(

width:10

),




Expanded(

child:

_dashboardCard(

"Accepted",

"$acceptedRides",

Icons.check_circle

),

),



],



),






const SizedBox(

height:16

),





_dashboardCard(

"Total Earnings",

"₹ $totalEarning",

Icons.currency_rupee

),





const SizedBox(

height:16

),





Card(

child:

ListTile(

leading:

const Icon(

Icons.info

),



title:

const Text(

"Current Filters"

),



subtitle:

Text(

"Min Fare ₹${app.settings.minimumFare}\n"

"Min ₹/KM ${app.settings.minimumPerKm}\n"

"Max Distance ${app.settings.maximumDistance} KM"

),



),



),





],



),



),



);



}








Widget _dashboardCard(

String title,

String value,

IconData icon

){



return Card(



child:

Padding(

padding:

const EdgeInsets.all(18),



child:

Column(



children:[



Icon(icon),



const SizedBox(

height:8

),



Text(

title

),



Text(

value,

style:

const TextStyle(

fontSize:22,

fontWeight:FontWeight.bold

),

),



],



),



),



);



}



}
