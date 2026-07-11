import 'package:flutter/material.dart';

import '../models/settings_model.dart';



class AppStateProvider extends ChangeNotifier {



bool _automationRunning=false;


bool get automationRunning =>
_automationRunning;



SettingsModel settings =
SettingsModel();





void toggleAutomation(){


_automationRunning =
!_automationRunning;


notifyListeners();


}





void updateSettings(
SettingsModel newSettings
){


settings =
newSettings;


notifyListeners();


}





void startAutomation(){

_automationRunning=true;

notifyListeners();

}





void stopAutomation(){

_automationRunning=false;

notifyListeners();

}



}
