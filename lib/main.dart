import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'data/database/ride_database.dart';
import 'data/database/settings_database.dart';

import 'services/notifications/notification_service.dart';
import 'services/app_state_provider.dart';

import 'screens/main_navigation.dart';





void main() async {


  WidgetsFlutterBinding.ensureInitialized();



  runZonedGuarded(() async {



    await RideDatabase.initialize();



    await SettingsDatabase.initialize();



    await NotificationService.initialize();




    runApp(

      const RideBotApp(),

    );



  }, (error, stackTrace) {



    runApp(

      ErrorApp(

        error: error.toString(),

      ),

    );


  });



}







class RideBotApp extends StatelessWidget {


  const RideBotApp({

    super.key,

  });



  @override
  Widget build(BuildContext context) {



    return ChangeNotifierProvider(


      create: (_) => AppStateProvider(),



      child: MaterialApp(



        debugShowCheckedModeBanner:false,



        title:"RideBot Pro",



        theme:ThemeData(

          useMaterial3:true,

        ),



        home:const MainNavigation(),



      ),



    );


  }



}







class ErrorApp extends StatelessWidget {


  final String error;


  const ErrorApp({

    super.key,

    required this.error,

  });



  @override
  Widget build(BuildContext context) {



    return MaterialApp(


      home:Scaffold(


        backgroundColor:Colors.red,



        body:SafeArea(



          child:Padding(



            padding:const EdgeInsets.all(20),



            child:Text(


              "RIDEBOT ERROR\n\n$error",



              style:const TextStyle(



                color:Colors.white,

                fontSize:18,

              ),



            ),



          ),



        ),



      ),



    );


  }



}
