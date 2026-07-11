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




val text =
root.text?.toString()
?.lowercase()
?: ""



for(keyword in keywords){


if(text.contains(keyword.lowercase())){


root.performAction(
AccessibilityNodeInfo.ACTION_CLICK
)


return true


}



}





for(i in 0 until root.childCount){


val child =
root.getChild(i)



if(findAndClick(child, keywords)){


return true


}



}



return false



}



}
