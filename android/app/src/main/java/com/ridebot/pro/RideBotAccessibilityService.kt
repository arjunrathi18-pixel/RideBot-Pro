package com.ridebot.pro


import android.accessibilityservice.AccessibilityService

import android.view.accessibility.AccessibilityEvent

import android.view.accessibility.AccessibilityNodeInfo





class RideBotAccessibilityService : AccessibilityService() {



override fun onServiceConnected() {

super.onServiceConnected()


RideBotBridge.sendStatus(

"Accessibility Service Connected"

)

}







override fun onAccessibilityEvent(

event: AccessibilityEvent?

) {



if(event == null){

return

}





if(event.eventType == AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED ||

event.eventType == AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED){





val rootNode = rootInActiveWindow ?: return





val text =

extractText(rootNode)






if(text.isNotEmpty()){



// Future ride screen parsing

// Flutter bridge will receive data here



}



}



}







private fun extractText(

node: AccessibilityNodeInfo?

): String {



if(node == null){

return ""

}





val builder = StringBuilder()





if(node.text != null){

builder.append(

node.text.toString()

)

}





for(i in 0 until node.childCount){



builder.append(

extractText(

node.getChild(i)

)

)



}





return builder.toString()



}







override fun onInterrupt() {



RideBotBridge.sendStatus(

"Accessibility Service Interrupted"

)



}



}
