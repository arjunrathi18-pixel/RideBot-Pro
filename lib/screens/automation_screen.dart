import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/app_state_provider.dart';



class AutomationScreen extends StatelessWidget {


const AutomationScreen({
super.key
});



@override
Widget build(BuildContext context){


final state =
context.watch<AppStateProvider>();



return Scaffold(


appBar:
AppBar(

title:
const Text(
"Automation"
),

),



body:
Center(


child:
Column(

mainAxisAlignment:
MainAxisAlignment.center,


children:[



Icon(

state.automationRunning

?
Icons.play_circle

:
Icons.pause_circle,

size:90,

),



const SizedBox(
height:20
),




Text(

state.automationRunning

?
"Service Active"

:
"Service Offline",

style:
const TextStyle(

fontSize:22,

fontWeight:
FontWeight.bold

)

),





const SizedBox(
height:30
),




FilledButton.icon(

icon:
Icon(

state.automationRunning

?
Icons.stop

:
Icons.play_arrow

),


label:
Text(

state.automationRunning

?
"Stop Automation"

:
"Start Automation"

),



onPressed:(){



state.toggleAutomation();



},



)





],


),


),



);


}



}
