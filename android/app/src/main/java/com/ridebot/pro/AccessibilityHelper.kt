package com.ridebot.pro


import android.view.accessibility.AccessibilityNodeInfo





object AccessibilityHelper {





fun findAndClick(

root: AccessibilityNodeInfo?,

keywords: List<String>

): Boolean {



if(root == null){

return false

}







val nodeText =

(

root.text?.toString()

?: ""

)

.lowercase()







val nodeDescription =

(

root.contentDescription?.toString()

?: ""

)

.lowercase()








for(keyword in keywords){



val key =

keyword.lowercase()





if(

nodeText.contains(key)

||

nodeDescription.contains(key)

){



if(

root.isClickable

){



root.performAction(

AccessibilityNodeInfo.ACTION_CLICK

)



return true



}







var parent =

root.parent





while(parent != null){



if(parent.isClickable){



parent.performAction(

AccessibilityNodeInfo.ACTION_CLICK

)



return true



}



parent = parent.parent



}



}



}








for(i in 0 until root.childCount){



val child =

root.getChild(i)





if(

findAndClick(

child,

keywords

)

){



return true



}



}







return false



}





}
