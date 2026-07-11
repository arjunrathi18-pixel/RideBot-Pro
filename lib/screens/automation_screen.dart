import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:android_intent_plus/android_intent.dart';


import '../services/app_state_provider.dart';




class AutomationScreen extends StatelessWidget {


const AutomationScreen({

super.key

});





Future<void> openAccessibilitySettings() async {


const intent = AndroidIntent(

action:

"android.settings.ACCESSIBILITY_SETTINGS",

);


await intent.launch();


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

"Automation"

),

centerTitle:true,

),





body:

Padding(

padding:

const EdgeInsets.all(20),



child:

Column(

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

80,

),




const SizedBox(

height:15

),




Text(

app.automationRunning

?

"Automation Active"

:

"Automation Stopped",



style:

const TextStyle(

fontSize:22,

fontWeight:FontWeight.bold

),



),



],



),



),



),





const SizedBox(

height:20

),





FilledButton.icon(



icon:

Icon(

app.automationRunning

?

Icons.stop

:

Icons.play_arrow

),




label:

Text(

app.automationRunning

?

"Stop Automation"

:

"Start Automation"

),





onPressed:

(){



if(app.automationRunning){



app.stopAutomation();



}

else{



app.startAutomation();



}



},



),





const SizedBox(

height:15

),





OutlinedButton.icon(



icon:

const Icon(

Icons.accessibility

),



label:

const Text(

"Open Accessibility Settings"

),




onPressed:

openAccessibilitySettings,



),





const SizedBox(

height:20

),





const Card(



child:

ListTile(



leading:

Icon(

Icons.info

),



title:

Text(

"How it works"

),



subtitle:

Text(

"RideBot reads ride offers using Accessibility Service and applies your filters."

),



),



),





],



),



),



);



}



}
