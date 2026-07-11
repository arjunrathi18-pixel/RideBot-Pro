import 'package:flutter/material.dart';


import '../models/settings_model.dart';


import '../data/database/settings_database.dart';





class AppStateProvider extends ChangeNotifier {



bool _automationRunning = false;



bool get automationRunning =>

_automationRunning;






SettingsModel _settings =

SettingsModel();



SettingsModel get settings =>

_ settings;






Future<void> initialize() async {



_settings =

SettingsDatabase.getSettings();



notifyListeners();



}








void toggleAutomation(){



_automationRunning =

!_automationRunning;



notifyListeners();



}








void startAutomation(){



_automationRunning = true;


notifyListeners();



}








void stopAutomation(){



_automationRunning = false;


notifyListeners();



}








Future<void> updateSettings(

SettingsModel newSettings

) async {



_settings = newSettings;



await SettingsDatabase.saveSettings(

_settings

);



notifyListeners();



}









void updateAutoAccept(

bool value

){



_settings.autoAccept = value;



notifyListeners();



save();



}








void updateMinimumFare(

double value

){



_settings.minimumFare = value;



notifyListeners();



save();



}








void updateMinimumPerKm(

double value

){



_settings.minimumPerKm = value;



notifyListeners();



save();



}








void updateMaximumDistance(

double value

){



_settings.maximumDistance = value;



notifyListeners();



save();



}








void updateAcceptDelay(

int value

){



_settings.acceptDelay = value;



notifyListeners();



save();



}









Future<void> save() async {



await SettingsDatabase.saveSettings(

_settings

);



}



}
