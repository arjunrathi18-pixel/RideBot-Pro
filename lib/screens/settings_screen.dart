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





final settings =

app.settings;







return Scaffold(



appBar:

AppBar(

title:

const Text(

"RideBot Settings"

),

centerTitle:true,

),






body:

ListView(



padding:

const EdgeInsets.all(16),



children:[





Card(

child:

SwitchListTile(



title:

const Text(

"Auto Accept Ride"

),



subtitle:

const Text(

"Automatically accept matching rides"

),




value:

settings.autoAccept,





onChanged:

(value){



app.updateAutoAccept(

value

);



},



),



),






const SizedBox(

height:12,

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

"₹ ${settings.minimumFare}"

),





trailing:

SizedBox(



width:160,



child:

Slider(



min:0,



max:1000,



value:

settings.minimumFare,



onChanged:

(value){



app.updateMinimumFare(

value

);



},



),



),



),



),







Card(

child:

ListTile(



title:

const Text(

"Minimum ₹ / KM"

),



subtitle:

Text(

"₹ ${settings.minimumPerKm}"

),





trailing:

SizedBox(



width:160,



child:

Slider(



min:1,



max:100,



value:

settings.minimumPerKm,



onChanged:

(value){



app.updateMinimumPerKm(

value

);



},



),



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

"${settings.maximumDistance} KM"

),





trailing:

SizedBox(



width:160,



child:

Slider(



min:1,



max:100,



value:

settings.maximumDistance,



onChanged:

(value){



app.updateMaximumDistance(

value

);



},



),



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

"${settings.acceptDelay} seconds"

),





trailing:

DropdownButton<int>(



value:

settings.acceptDelay,



items:

[1,2,3,5,10]

.map((e){



return DropdownMenuItem<int>(



value:e,



child:

Text(

"$e sec"

),



);



})

.toList(),





onChanged:

(value){



if(value != null){



app.updateAcceptDelay(

value

);



}



},



),



),



),






],



),



);



}



}
