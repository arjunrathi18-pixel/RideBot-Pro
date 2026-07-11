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

_settings;









Future<void> initialize() async {



_settings =

SettingsDatabase.getSettings();



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









void toggleAutomation(){



_automationRunning =

!_automationRunning;



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









Future<void> updateAutoAccept(

bool value

) async {



_settings =

_settings.copyWith(

autoAccept: value,

);



await save();



}








Future<void> updateMinimumFare(

double value

) async {



_settings =

_settings.copyWith(

minimumFare: value,

);



await save();



}








Future<void> updateMinimumPerKm(

double value

) async {



_settings =

_settings.copyWith(

minimumPerKm: value,

);



await save();



}








Future<void> updateMaximumDistance(

double value

) async {



_settings =

_settings.copyWith(

maximumDistance: value,

);



await save();



}








Future<void> updateAcceptDelay(

int value

) async {



_settings =

_settings.copyWith(

acceptDelay: value,

);



await save();



}









Future<void> save() async {



await SettingsDatabase.saveSettings(

_settings

);



notifyListeners();



}



}
