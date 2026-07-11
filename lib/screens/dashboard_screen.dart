import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../services/app_state_provider.dart';

import '../data/database/ride_database.dart';





class DashboardScreen extends StatefulWidget {



const DashboardScreen({

super.key

});





@override

State<DashboardScreen> createState()

=> _DashboardScreenState();



}







class _DashboardScreenState

extends State<DashboardScreen>{





int totalRides = 0;


int acceptedRides = 0;


double totalEarning = 0;





@override

void initState(){



super.initState();


loadData();



}







Future<void> loadData() async {



final rides =

await RideDatabase.getAllRides();



final accepted =

await RideDatabase.getAcceptedRides();



final earning =

await RideDatabase.getTotalEarning();






setState((){



totalRides = rides.length;



acceptedRides = accepted.length;



totalEarning = earning;



});



}







@override

Widget build(BuildContext context){



final app =

context.watch<AppStateProvider>();





return Scaffold(



appBar:

AppBar(

title:

const Text(

"RideBot Pro Dashboard"

),



centerTitle:true,



),







body:

RefreshIndicator(



onRefresh:

loadData,



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

70,



),




const SizedBox(

height:10,

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

fontWeight:FontWeight.bold,

),



),



],



),



),



),







const SizedBox(

height:16,

),





Row(



children:[



Expanded(



child:

_infoCard(

"Total Rides",

"$totalRides",

Icons.motorcycle,

),



),





const SizedBox(

width:10,

),





Expanded(



child:

_infoCard(

"Accepted",

"$acceptedRides",

Icons.check_circle,

),



),



],



),






const SizedBox(

height:16,

),






_infoCard(

"Total Earnings",

"₹ ${totalEarning.toStringAsFixed(2)}",

Icons.currency_rupee,

),







],



),



),



);



}









Widget _infoCard(

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

height:8,

),



Text(title),



Text(

value,

style:

const TextStyle(

fontSize:22,

fontWeight:FontWeight.bold,

),

),



],



),



),



);



}



}
