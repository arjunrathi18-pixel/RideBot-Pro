import 'package:flutter/material.dart';


import 'dashboard_screen.dart';

import 'automation_screen.dart';

import 'history_screen.dart';

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







final List<Widget> pages = const [



DashboardScreen(),



AutomationScreen(),



HistoryScreen(),



SettingsScreen(),



];








@override

Widget build(BuildContext context){



return Scaffold(




body:

pages[currentIndex],







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






destinations:

const [





NavigationDestination(



icon:

Icon(

Icons.dashboard

),



label:

"Dashboard"



),







NavigationDestination(



icon:

Icon(

Icons.smart_toy

),



label:

"Automation"



),







NavigationDestination(



icon:

Icon(

Icons.history

),



label:

"History"



),







NavigationDestination(



icon:

Icon(

Icons.settings

),



label:

"Settings"



),





],



),





);



}





}
