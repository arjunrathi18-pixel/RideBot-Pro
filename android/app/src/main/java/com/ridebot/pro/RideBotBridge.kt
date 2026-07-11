package com.ridebot.pro


import io.flutter.embedding.engine.FlutterEngine

import io.flutter.plugin.common.MethodChannel






object RideBotBridge {



private const val CHANNEL = "ridebot/automation"





private var channel: MethodChannel? = null







fun initialize(

flutterEngine: FlutterEngine

){



channel = MethodChannel(

flutterEngine.dartExecutor.binaryMessenger,

CHANNEL

)



}








fun sendRideData(

fare: Double,

distance: Double,

pickup: String,

drop: String

){



channel?.invokeMethod(

"newRide",

mapOf(

"fare" to fare,

"distance" to distance,

"pickup" to pickup,

"drop" to drop

)

)



}








fun sendStatus(

status: String

){



channel?.invokeMethod(

"serviceStatus",

status

)



}



}
