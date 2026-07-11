import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'models/ride_model.dart';
import 'models/settings_model.dart';


import 'data/database/ride_database.dart';
import 'data/database/settings_database.dart';


import 'services/notifications/notification_service.dart';
import 'services/app_state_provider.dart';


import 'screens/main_navigation.dart';






Future<void> main() async {



WidgetsFlutterBinding.ensureInitialized();





// Hive Initialize

await Hive.initFlutter();





// Register Hive Adapters

Hive.registerAdapter(

RideModelAdapter()

);



Hive.registerAdapter(

SettingsModelAdapter()

);






// Database Initialize

await RideDatabase.initialize();


await SettingsDatabase.initialize();






// Notification Initialize

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

Widget build(BuildContext context) {



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



brightness:

Brightness.light,



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
