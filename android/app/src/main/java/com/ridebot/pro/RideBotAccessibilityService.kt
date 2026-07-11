package com.ridebot.pro


import android.accessibilityservice.AccessibilityService
import android.util.Log
import android.view.accessibility.AccessibilityEvent
import android.view.accessibility.AccessibilityNodeInfo





class RideBotAccessibilityService :

    AccessibilityService() {



companion object {



var instance:

RideBotAccessibilityService? = null



}







override fun onServiceConnected(){



super.onServiceConnected()



instance = this



Log.d(

"RideBot",

"Accessibility Connected"

)



}








override fun onAccessibilityEvent(

event: AccessibilityEvent?

){



try {



val root =

rootInActiveWindow

?: return





val screenText =

readNodeText(root)





if(screenText.isNotEmpty()){



Log.d(

"RideBot",

screenText

)





val fare =

extractFare(screenText)





val distance =

extractDistance(screenText)








if(fare > 0 && distance > 0){





RideBotBridge.sendRideData(



fare,



distance,



screenText



)





}



}





}

catch(e:Exception){



Log.e(

"RideBot",

e.message ?: "Error"

)



}



}









private fun readNodeText(

node: AccessibilityNodeInfo

): String {



val builder =

StringBuilder()






if(node.text != null){



builder.append(

node.text

)

builder.append(" ")



}








for(i in 0 until node.childCount){



val child =

node.getChild(i)



if(child != null){



builder.append(

readNodeText(child)

)



}



}






return builder.toString()



}









private fun extractFare(

text:String

):Double {



val regex =

Regex(

"\\d+(\\.\\d+)?"

)



val value =

regex.find(text)



return value

?.value

?.toDoubleOrNull()

?:0.0



}









private fun extractDistance(

text:String

):Double {



val regex =

Regex(

"(\\d+(\\.\\d+)?)\\s?(km|KM)"

)





val value =

regex.find(text)





return value

?.groupValues?.get(1)

?.toDoubleOrNull()

?:0.0



}









fun clickAcceptButton(){



val clicked =

AccessibilityHelper.findAndClick(



rootInActiveWindow,



listOf(



"accept",

"confirm",

"book",

"continue",

"ride now"



)



)





Log.d(

"RideBot",

"Accept Click: $clicked"

)



}








override fun onInterrupt(){



Log.d(

"RideBot",

"Interrupted"

)



}








override fun onDestroy(){



instance = null



super.onDestroy()



}



}
