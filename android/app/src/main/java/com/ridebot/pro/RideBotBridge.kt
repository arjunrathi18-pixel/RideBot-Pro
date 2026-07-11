package com.ridebot.pro


import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel





object RideBotBridge {



private const val CHANNEL_NAME =

"ridebot/automation"





private lateinit var channel: MethodChannel






fun initialize(

flutterEngine: FlutterEngine

){



channel = MethodChannel(



flutterEngine.dartExecutor.binaryMessenger,



CHANNEL_NAME



)







channel.setMethodCallHandler {

call,

result ->






when(call.method){



"accept_ride" -> {



RideBotAccessibilityService

.instance

?.clickAcceptButton()



result.success(true)



}







else -> {



result.notImplemented()



}



}



}



}








fun sendRideData(

fare: Double,

distance: Double,

pickup: String

){



if(::channel.isInitialized){



channel.invokeMethod(



"ride_detected",



mapOf(



"fare" to fare,



"distance" to distance,



"pickup" to pickup



)



)



}



}



}
