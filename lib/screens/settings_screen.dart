import 'package:flutter/material.dart';



class SettingsScreen extends StatelessWidget {


const SettingsScreen({
super.key
});



@override
Widget build(BuildContext context){


return Scaffold(


appBar:
AppBar(

title:
const Text(
"Settings"
),

),



body:
ListView(

padding:
const EdgeInsets.all(16),



children:[



Card(

child:
ListTile(

leading:
const Icon(
Icons.notifications
),

title:
const Text(
"Notifications"
),

subtitle:
const Text(
"Ride alerts and status"
),


),

),





Card(

child:
ListTile(

leading:
const Icon(
Icons.location_on
),

title:
const Text(
"Location Zones"
),

subtitle:
const Text(
"Manage preferred areas"
),


),

),





Card(

child:
ListTile(

leading:
const Icon(
Icons.security
),

title:
const Text(
"Permissions"
),

subtitle:
const Text(
"Accessibility and background access"
),


),

),



],


),



);



}



}
