import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/app_state_provider.dart';



class DashboardScreen extends StatelessWidget {


const DashboardScreen({
super.key
});



@override
Widget build(BuildContext context){


final state =
context.watch<AppStateProvider>();


return Scaffold(


appBar: AppBar(

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
Column(

children:[


const Icon(

Icons.smart_toy,

size:50,

),


const SizedBox(
height:10
),



Text(

state.automationRunning

?
"Automation Running"

:
"Automation Stopped",

style:
const TextStyle(

fontSize:20,

fontWeight:
FontWeight.bold

),


),



],


),


),


),





const SizedBox(
height:20
),





Row(

children:[


Expanded(

child:
_statCard(

"Today's Rides",

"0",

Icons.motorcycle

)

),



Expanded(

child:
_statCard(

"Earning",

"₹0",

Icons.currency_rupee

)

),



],


),





const SizedBox(
height:20
),





Card(

child:
ListTile(


leading:
const Icon(
Icons.analytics
),


title:
const Text(
"Performance"
),


subtitle:
const Text(
"No rides recorded yet"
),


),


)





],


),



),



);


}





Widget _statCard(

String title,

String value,

IconData icon

){



return Card(

child:
Padding(

padding:
const EdgeInsets.all(16),


child:
Column(

children:[


Icon(icon),


const SizedBox(
height:8
),


Text(title),


Text(

value,

style:
const TextStyle(

fontSize:22,

fontWeight:
FontWeight.bold

)

)



],


),


),


);



}



}
