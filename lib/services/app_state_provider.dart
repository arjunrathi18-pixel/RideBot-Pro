import 'package:flutter/material.dart';



class AppStateProvider extends ChangeNotifier {



bool _automationRunning = false;



bool get automationRunning =>
    _automationRunning;




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



}
