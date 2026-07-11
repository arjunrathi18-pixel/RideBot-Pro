import 'package:flutter_local_notifications/flutter_local_notifications.dart';





class NotificationService {



static final FlutterLocalNotificationsPlugin _plugin =

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





await _plugin.initialize(

settings

);



}









static Future<void> showNotification(

String title,

String body

) async {



const androidDetails =

AndroidNotificationDetails(



'ridebot_channel',



'RideBot Notifications',



importance:

Importance.high,



priority:

Priority.high,



);







await _plugin.show(



DateTime.now()

.millisecondsSinceEpoch

.remainder(100000),



title,



body,



const NotificationDetails(

android: androidDetails,

),



);



}







static Future<void> rideDetected(

double fare,

double distance

) async {



await showNotification(

"New Ride Detected",

"₹$fare | $distance KM"

);



}








static Future<void> rideAccepted() async {



await showNotification(

"Ride Accepted",

"Ride successfully accepted"

);



}








static Future<void> rideRejected() async {



await showNotification(

"Ride Rejected",

"Ride did not match filters"

);



}



}
