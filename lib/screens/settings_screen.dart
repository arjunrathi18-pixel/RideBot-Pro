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


appBar:

AppBar(

title:
const Text("Settings")

),



body:

ListView(

padding:
const EdgeInsets.all(16),


children:[



SwitchListTile(

title:
const Text(
"Auto Accept"
),


value:
app.settings.autoAccept,


onChanged:(value){



app.settings.autoAccept =
value;


app.notifyListeners();


},

),




ListTile(

title:
const Text(
"Minimum Fare"
),


subtitle:
Text(
"₹${app.settings.minimumFare}"
),


),




ListTile(

title:
const Text(
"Minimum ₹/KM"
),


subtitle:
Text(
"${app.settings.minimumPerKm}"
),


),




ListTile(

title:
const Text(
"Maximum Distance"
),


subtitle:
Text(
"${app.settings.maximumDistance} KM"
),


),



],


),


);


}



}
