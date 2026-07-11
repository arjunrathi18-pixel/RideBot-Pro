package com.ridebot.pro


import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel



object RideBotBridge {



private const val CHANNEL =
"ridebot/automation"



private lateinit var channel:
MethodChannel





fun initialize(
engine: FlutterEngine
){


channel =
MethodChannel(

engine.dartExecutor.binaryMessenger,

CHANNEL

)


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
