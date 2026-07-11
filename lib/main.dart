import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import 'data/database/ride_database.dart';
import 'data/database/settings_database.dart';


import 'services/notifications/notification_service.dart';


import 'services/app_state_provider.dart';


import 'screens/main_navigation.dart';







Future<void> main() async {



WidgetsFlutterBinding.ensureInitialized();






await RideDatabase.initialize();



await SettingsDatabase.initialize();



await NotificationService.initialize();







runApp(

const RideBotApp()

);



}









class RideBotApp extends StatelessWidget {



const RideBotApp({

super.key

});







@override

Widget build(BuildContext context){



return ChangeNotifierProvider(



create:

(context)

=> AppStateProvider(),





child:

MaterialApp(



debugShowCheckedModeBanner:

false,



title:

"RideBot Pro",





theme:

ThemeData(



useMaterial3:

true,



colorScheme:

ColorScheme.fromSeed(

seedColor:

Colors.blue,

),



),






home:

const MainNavigation(),



),



);



}



}
