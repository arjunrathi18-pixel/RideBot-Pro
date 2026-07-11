import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../models/settings_model.dart';
import '../models/ride_model.dart';


import '../data/database/settings_database.dart';
import '../data/database/ride_database.dart';


import 'automation/automation_service.dart';
import 'notifications/notification_service.dart';






class AppStateProvider extends ChangeNotifier {



static const MethodChannel _channel =

MethodChannel(

'ridebot/automation'

);





SettingsModel settings =

const SettingsModel();



bool automationRunning = false;


int totalRides = 0;


double totalEarning = 0;







AppStateProvider(){

initialize();

listenAndroidEvents();

}








Future<void> initialize() async {



settings =

SettingsDatabase.getSettings();



await loadStats();



notifyListeners();



}








void listenAndroidEvents(){



_channel.setMethodCallHandler(

(MethodCall call) async {



switch(call.method){



case "newRide":



final data =

Map<String,dynamic>.from(

call.arguments

);






final ride = RideModel(



platform:"RideBot",



fare:

(data["fare"] ?? 0)

.toDouble(),



distance:

(data["distance"] ?? 0)

.toDouble(),



earningPerKm:

(data["distance"] ?? 0) > 0

?

(data["fare"] ?? 0) /

(data["distance"] ?? 1)

:

0,



pickup:

data["pickup"] ?? "",



dropLocation:

data["drop"] ?? "",



status:"PENDING",



createdAt:

DateTime.now(),



);






await processRide(ride);



break;





case "serviceStatus":



break;



}



}

);

}





Future<void> processRide(

RideModel ride

) async {



await NotificationService.rideDetected(

ride.fare,

ride.distance

);



if(automationRunning){



await AutomationService.processRide(

ride

);



}





await loadStats();



notifyListeners();



}









Future<void> loadStats() async {



totalRides =

await RideDatabase.getTotalRides();



totalEarning =

await RideDatabase.getTotalEarning();



notifyListeners();



}









Future<void> startAutomation() async {



automationRunning = true;



await AutomationService.initialize(

settings

);



notifyListeners();



}








void stopAutomation(){



automationRunning = false;



AutomationService.stop();



notifyListeners();



}








Future<void> updateAutoAccept(bool value) async {



settings = settings.copyWith(

autoAccept:value

);



await save();



}



Future<void> updateMinimumFare(double value) async {



settings = settings.copyWith(

minimumFare:value

);



await save();



}



Future<void> updateMinimumPerKm(double value) async {



settings = settings.copyWith(

minimumPerKm:value

);



await save();



}



Future<void> updateMaximumDistance(double value) async {



settings = settings.copyWith(

maximumDistance:value

);



await save();



}



Future<void> updateAcceptDelay(int value) async {



settings = settings.copyWith(

acceptDelay:value

);



await save();



}






Future<void> save() async {



await SettingsDatabase.saveSettings(

settings

);



notifyListeners();



}



}
