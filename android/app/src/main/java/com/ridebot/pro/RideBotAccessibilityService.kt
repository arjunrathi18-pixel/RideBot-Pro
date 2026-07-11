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





    override fun onServiceConnected() {


        super.onServiceConnected()


        instance = this


        Log.d(
            "RideBot",
            "Accessibility Service Connected"
        )


    }






    override fun onAccessibilityEvent(
        event: AccessibilityEvent?
    ) {


        try {


            val root =
                rootInActiveWindow
                ?: return



            val screenText =
                readText(root)



            if(screenText.isNotEmpty()){


                val fare =
                    RideExtractor.extractFare(
                        screenText
                    )



                val distance =
                    RideExtractor.extractDistance(
                        screenText
                    )



                if(
                    fare > 0 &&
                    distance > 0
                ){



                    Log.d(
                        "RideBot",
                        "Ride Found Fare=$fare Distance=$distance"
                    )



                    RideBotBridge.sendRideData(

                        fare,

                        distance,

                        screenText

                    )



                }



            }



        }

        catch(e: Exception){


            Log.e(

                "RideBot",

                "Error: ${e.message}"

            )


        }



    }








    private fun readText(
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
                    readText(child)
                )


            }


        }



        return builder.toString()



    }








    fun clickAcceptButton(){



        val clicked =
            AccessibilityHelper.findAndClick(

                rootInActiveWindow,

                listOf(

                    "accept",

                    "confirm",

                    "book",

                    "ride now",

                    "continue"

                )

            )




        if(clicked){


            Log.d(

                "RideBot",

                "Accept button clicked"

            )


        }

        else{


            Log.d(

                "RideBot",

                "Accept button not found"

            )


        }



    }








    override fun onInterrupt(){


        Log.d(

            "RideBot",

            "Service Interrupted"

        )


    }








    override fun onDestroy(){


        instance = null


        Log.d(

            "RideBot",

            "Service Destroyed"

        )


        super.onDestroy()


    }



}
