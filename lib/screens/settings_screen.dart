import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../services/app_state_provider.dart';



class SettingsScreen extends StatelessWidget {


const SettingsScreen({
super.key
});




@override
Widget build(BuildContext context){


final app =

context.watch<AppStateProvider>();



return Scaffold(



appBar: AppBar(

title:

const Text(

"Settings"

),

centerTitle: true,

),





body:

ListView(

padding:

const EdgeInsets.all(16),



children: [





Card(

child:

SwitchListTile(

title:

const Text(

"Auto Accept Ride"

),


subtitle:

const Text(

"Automatically accept filtered rides"

),



value:

app.settings.autoAccept,



onChanged:

(value){


app.updateAutoAccept(

value

);



},


),


),





const SizedBox(

height: 12

),






Card(

child:

ListTile(

title:

const Text(

"Minimum Fare"

),



subtitle:

Text(

"₹ ${app.settings.minimumFare}"

),



trailing:

const Icon(

Icons.currency_rupee

),


),


),






Card(

child:

ListTile(

title:

const Text(

"Minimum Earning / KM"

),



subtitle:

Text(

"₹ ${app.settings.minimumPerKm} / KM"

),



trailing:

const Icon(

Icons.route

),


),


),





Card(

child:

ListTile(

title:

const Text(

"Maximum Distance"

),



subtitle:

Text(

"${app.settings.maximumDistance} KM"

),



trailing:

const Icon(

Icons.location_on

),


),


),






Card(

child:

ListTile(

title:

const Text(

"Accept Delay"

),



subtitle:

Text(

"${app.settings.acceptDelay} Seconds"

),



trailing:

const Icon(

Icons.timer

),


),


),





],


),



);



}



}
