import 'package:flutter_local_notifications/flutter_local_notifications.dart';



class NotificationService {


static final FlutterLocalNotificationsPlugin _plugin =

FlutterLocalNotificationsPlugin();






static Future<void> initialize() async {



const AndroidInitializationSettings androidSettings =

AndroidInitializationSettings(

'notification_icon',

);





const InitializationSettings settings =

InitializationSettings(

android: androidSettings,

);




await _plugin.initialize(settings);



}








static Future<void> rideDetected(

double fare,

double distance,

) async {



const AndroidNotificationDetails androidDetails =

AndroidNotificationDetails(


'ridebot_channel',


'RideBot Alerts',


channelDescription:

'Ride notifications',


importance:

Importance.high,


priority:

Priority.high,

);



await _plugin.show(


1,


'New Ride Found',


'₹${fare.toStringAsFixed(0)} • ${distance.toStringAsFixed(1)} KM',



const NotificationDetails(

android: androidDetails,

),


);



}








static Future<void> rideAccepted() async {



await _plugin.show(


2,


'Ride Accepted',


'RideBot accepted the ride',



const NotificationDetails(



android: AndroidNotificationDetails(


'ridebot_channel',


'RideBot Alerts',


importance: Importance.high,


priority: Priority.high,


),



),


);



}








static Future<void> rideRejected() async {



await _plugin.show(


3,


'Ride Rejected',


'Ride did not match your filter',



const NotificationDetails(



android: AndroidNotificationDetails(


'ridebot_channel',


'RideBot Alerts',


importance: Importance.defaultImportance,


),



),


);



}



}
