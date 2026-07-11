import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'services/app_state_provider.dart';
import 'screens/main_navigation.dart';





void main() {


  WidgetsFlutterBinding.ensureInitialized();



  FlutterError.onError = (FlutterErrorDetails details) {

    FlutterError.presentError(details);

  };



  runZonedGuarded(


    () {


      runApp(

        const RideBotApp(),

      );


    },


    (error, stackTrace) {


      runApp(

        ErrorApp(

          error: error.toString(),

        ),

      );


    },


  );



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


        debugShowCheckedModeBanner: false,



        title: "RideBot Pro",



        theme: ThemeData(


          useMaterial3: true,


          colorScheme: ColorScheme.fromSeed(

            seedColor: Colors.blue,

          ),


        ),



        home: const MainNavigation(),





        builder: (context, child) {



          ErrorWidget.builder = (FlutterErrorDetails error) {



            return ErrorScreen(

              error: error.exception.toString(),

            );


          };



          return child!;


        },



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


      debugShowCheckedModeBanner: false,


      home: ErrorScreen(

        error: error,

      ),


    );


  }


}









class ErrorScreen extends StatelessWidget {


  final String error;



  const ErrorScreen({

    super.key,

    required this.error,

  });





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      backgroundColor: Colors.red,



      body: SafeArea(



        child: Padding(



          padding: const EdgeInsets.all(20),



          child: SingleChildScrollView(



            child: Column(



              crossAxisAlignment: CrossAxisAlignment.start,



              children: [



                const Text(


                  "RIDE BOT ERROR",



                  style: TextStyle(



                    color: Colors.white,



                    fontSize: 28,



                    fontWeight: FontWeight.bold,



                  ),



                ),




                const SizedBox(height: 20),




                Text(



                  error,



                  style: const TextStyle(



                    color: Colors.white,



                    fontSize: 16,



                  ),



                ),



              ],



            ),



          ),



        ),



      ),



    );



  }



}
