package com.ridebot.pro


import android.accessibilityservice.AccessibilityService

import android.view.accessibility.AccessibilityEvent

import android.view.accessibility.AccessibilityNodeInfo

import android.util.Log





class RideBotAccessibilityService :
AccessibilityService(){





override fun onAccessibilityEvent(
event: AccessibilityEvent?
){



val root =
rootInActiveWindow
?: return



val text =
readText(root)



if(text.isNotEmpty()){


val fare =
RideExtractor.extractFare(text)



val distance =
RideExtractor.extractDistance(text)



if(fare>0 && distance>0){



RideBotBridge.sendRideData(

fare,

distance,

text

)



}


}



}






private fun readText(
node: AccessibilityNodeInfo
):String{


val builder =
StringBuilder()



if(node.text!=null){

builder.append(
node.text
)

}



for(i in 0 until node.childCount){


val child =
node.getChild(i)


if(child!=null){

builder.append(
readText(child)
)

}


}



return builder.toString()


}






override fun onInterrupt(){

Log.d(
"RideBot",
"Interrupted"
)


}



}
