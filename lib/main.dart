import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/theme/app_theme.dart';
import 'screens/main_navigation.dart';
import 'services/app_state_provider.dart';



Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();



  // Initialize Local Database

  await Hive.initFlutter();



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
