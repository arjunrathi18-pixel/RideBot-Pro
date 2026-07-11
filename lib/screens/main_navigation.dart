import 'package:flutter/material.dart';


import 'dashboard_screen.dart';
import 'history_screen.dart';
import 'automation_screen.dart';
import 'settings_screen.dart';





class MainNavigation extends StatefulWidget {



const MainNavigation({

super.key

});





@override

State<MainNavigation> createState()

=> _MainNavigationState();



}







class _MainNavigationState

extends State<MainNavigation>{





int currentIndex = 0;







final List<Widget> screens = [



const DashboardScreen(),



const HistoryScreen(),



const AutomationScreen(),



const SettingsScreen(),



];








@override

Widget build(BuildContext context){



return Scaffold(



body:

screens[currentIndex],






bottomNavigationBar:

NavigationBar(



selectedIndex:

currentIndex,



onDestinationSelected:

(index){



setState((){



currentIndex = index;



});



},






destinations:[





NavigationDestination(



icon:

Icon(Icons.dashboard_outlined),



selectedIcon:

Icon(Icons.dashboard),



label:

"Dashboard",



),





NavigationDestination(



icon:

Icon(Icons.history_outlined),



selectedIcon:

Icon(Icons.history),



label:

"History",



),





NavigationDestination(



icon:

Icon(Icons.smart_toy_outlined),



selectedIcon:

Icon(Icons.smart_toy),



label:

"Automation",



),





NavigationDestination(



icon:

Icon(Icons.settings_outlined),



selectedIcon:

Icon(Icons.settings),



label:

"Settings",



),





],



),



);



}



}
