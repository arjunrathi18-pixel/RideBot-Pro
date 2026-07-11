import 'package:flutter/material.dart';


import '../models/settings_model.dart';


import '../data/database/settings_database.dart';


import '../data/database/ride_database.dart';


import 'automation/automation_service.dart';





class AppStateProvider extends ChangeNotifier {



SettingsModel settings =

const SettingsModel();





bool automationRunning = false;



int totalRides = 0;


double totalEarning = 0;








AppStateProvider(){



initialize();



}








Future<void> initialize() async {



settings =

SettingsDatabase.getSettings();





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



notifyListeners();



}








Future<void> updateAutoAccept(

bool value

) async {



settings = settings.copyWith(

autoAccept:value

);



await save();



}








Future<void> updateMinimumFare(

double value

) async {



settings = settings.copyWith(

minimumFare:value

);



await save();



}








Future<void> updateMinimumPerKm(

double value

) async {



settings = settings.copyWith(

minimumPerKm:value

);



await save();



}








Future<void> updateMaximumDistance(

double value

) async {



settings = settings.copyWith(

maximumDistance:value

);



await save();



}








Future<void> updateAcceptDelay(

int value

) async {



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
