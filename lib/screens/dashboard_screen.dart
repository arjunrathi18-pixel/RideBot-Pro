import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../services/app_state_provider.dart';





class DashboardScreen extends StatelessWidget {


const DashboardScreen({

super.key

});






@override

Widget build(BuildContext context){



final app =

context.watch<AppStateProvider>();






return Scaffold(



appBar:

AppBar(



title:

const Text(

"RideBot Pro"

),



centerTitle:true,



),






body:

SingleChildScrollView(



padding:

const EdgeInsets.all(16),



child:

Column(



children:[







Card(



child:

Padding(



padding:

const EdgeInsets.all(20),



child:

Row(



children:[



const Icon(

Icons.smart_toy,

size:50,

),



const SizedBox(

width:20,

),




Expanded(

child:

Column(



crossAxisAlignment:

CrossAxisAlignment.start,



children:[





Text(

app.automationRunning

?

"Automation Active"

:

"Automation Off",



style:

const TextStyle(

fontSize:20,

fontWeight:FontWeight.bold,

),



),





const SizedBox(

height:5,

),





const Text(

"RideBot is monitoring rides"

),





],



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

_statsCard(

context,

"Total Rides",

app.totalRides.toString(),

Icons.directions_car,

),



),





const SizedBox(

width:12,

),






Expanded(

child:

_statsCard(

context,

"Income",

"₹${app.totalEarning.toStringAsFixed(0)}",

Icons.currency_rupee,

),



),





],



),







const SizedBox(

height:16,

),






Card(

child:

ListTile(



leading:

const Icon(

Icons.speed,

),



title:

const Text(

"Ride Filter"

),



subtitle:

Text(

"₹${app.settings.minimumPerKm}/KM minimum"

),



),



),






const SizedBox(

height:16,

),






FilledButton.icon(



icon:

const Icon(

Icons.play_arrow,

),



label:

Text(

app.automationRunning

?

"Automation Running"

:

"Start Automation"

),



onPressed:

(){



if(!app.automationRunning){

app.startAutomation();

}



},



),






],



),



),



);



}








Widget _statsCard(

BuildContext context,

String title,

String value,

IconData icon,

){



return Card(



child:

Padding(



padding:

const EdgeInsets.all(16),



child:

Column(



children:[



Icon(

icon,

size:35,

),





const SizedBox(

height:10,

),





Text(

value,

style:

const TextStyle(

fontSize:22,

fontWeight:FontWeight.bold,

),

),





Text(title),





],



),



),



);



}



}
