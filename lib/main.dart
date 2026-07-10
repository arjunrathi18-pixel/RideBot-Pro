import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/theme/app_theme.dart';
import 'screens/main_navigation.dart';
import 'services/app_state_provider.dart';
import 'data/database/ride_database.dart';
import 'models/ride_model.dart';
import 'models/settings_model.dart';


Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();



  // Initialize Local Database

  await Hive.initFlutter();
  Hive.registerAdapter(
RideModelAdapter()
);


Hive.registerAdapter(
SettingsModelAdapter()
);


await RideDatabase.init();



  runApp(

    const RideBotApp()

  );


}





class RideBotApp extends StatelessWidget {


  const RideBotApp({
    super.key
  });



  @override
  Widget build(BuildContext context) {


    return MultiProvider(


      providers: [


        ChangeNotifierProvider(

          create: (_) => AppStateProvider(),

        ),


      ],



      child: MaterialApp(


        debugShowCheckedModeBanner: false,


        title: "RideBot Pro",



        theme: AppTheme.lightTheme,


        darkTheme: AppTheme.darkTheme,


        themeMode: ThemeMode.system,



        home: const MainNavigation(),



      ),


    );


  }


}
