package com.ridebot.pro


object RideExtractor {



fun extractFare(
text:String
):Double{


val regex =
Regex(
"""₹?\s?(\d+)"""
)


val match =
regex.find(text)



return match?.groupValues?.get(1)
?.toDouble()
?:0.0


}




fun extractDistance(
text:String
):Double{


val regex =
Regex(
"""(\d+(\.\d+)?)\s?KM""",
RegexOption.IGNORE_CASE
)



val match =
regex.find(text)



return match?.groupValues?.get(1)
?.toDouble()
?:0.0


}




}
