import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:permission_handler/permission_handler.dart';






class NotificationService {



static final FlutterLocalNotificationsPlugin _notifications =

FlutterLocalNotificationsPlugin();








static Future<void> initialize() async {



const androidSettings =

AndroidInitializationSettings(

'@mipmap/ic_launcher'

);





const settings =

InitializationSettings(

android: androidSettings,

);





await _notifications.initialize(

settings

);






await _createChannel();






await Permission.notification.request();



}









static Future<void> _createChannel() async {



const channel =

AndroidNotificationChannel(



'ridebot_channel',



'RideBot Notifications',



description:

'RideBot ride alerts',



importance:

Importance.high,



);






final androidPlugin =

_notifications.resolvePlatformSpecificImplementation<

AndroidFlutterLocalNotificationsPlugin

>();





await androidPlugin?.createNotificationChannel(

channel

);



}









static Future<void> showNotification(

String title,

String body

) async {



const details =

NotificationDetails(



android:

AndroidNotificationDetails(



'ridebot_channel',



'RideBot Notifications',



channelDescription:

'RideBot ride alerts',



importance:

Importance.high,



priority:

Priority.high,



),



);







await _notifications.show(



DateTime.now()

.millisecondsSinceEpoch

.remainder(100000),



title,



body,



details,



);



}








static Future<void> rideDetected(

double fare,

double distance

) async {



await showNotification(



"New Ride Detected",



"₹${fare.toStringAsFixed(0)} | ${distance.toStringAsFixed(1)} KM"



);



}








static Future<void> rideAccepted() async {



await showNotification(



"Ride Accepted",



"Ride accepted automatically"



);



}








static Future<void> rideRejected() async {



await showNotification(



"Ride Rejected",



"Ride did not match filters"



);



}



}
