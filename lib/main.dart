import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'data/database/ride_database.dart';
import 'data/database/settings_database.dart';


import 'services/app_state_provider.dart';
import 'services/notifications/notification_service.dart';


import 'screens/main_navigation.dart';





Future<void> main() async {



WidgetsFlutterBinding.ensureInitialized();





// SQLite Database

await RideDatabase.initialize();





// Settings Storage

await SettingsDatabase.initialize();





// Notification Service

await NotificationService.initialize();






final appState =

AppStateProvider();



await appState.initialize();






runApp(



ChangeNotifierProvider.value(



value:

appState,



child:

const RideBotApp(),



),



);



}









class RideBotApp extends StatelessWidget {



const RideBotApp({

super.key

});







@override

Widget build(BuildContext context){



return MaterialApp(



debugShowCheckedModeBanner:

false,



title:

"RideBot Pro",





theme:

ThemeData(



useMaterial3:

true,



colorSchemeSeed:

Colors.blue,



),





darkTheme:

ThemeData(



useMaterial3:

true,



colorSchemeSeed:

Colors.blue,



brightness:

Brightness.dark,



),





themeMode:

ThemeMode.system,






home:

const MainNavigation(),



);



}



}
