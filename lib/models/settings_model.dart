class SettingsModel {



final bool autoAccept;



final double minimumFare;



final double minimumPerKm;



final double maximumDistance;



final int acceptDelay;





SettingsModel({



this.autoAccept = false,



this.minimumFare = 100,



this.minimumPerKm = 12,



this.maximumDistance = 40,



this.acceptDelay = 2,



});








Map<String,dynamic> toMap(){



return {



"autoAccept": autoAccept,


"minimumFare": minimumFare,


"minimumPerKm": minimumPerKm,


"maximumDistance": maximumDistance,


"acceptDelay": acceptDelay,



};



}








factory SettingsModel.fromMap(

Map<String,dynamic> map

){



return SettingsModel(



autoAccept:

map["autoAccept"] ?? false,



minimumFare:

(map["minimumFare"] ?? 100)

.toDouble(),



minimumPerKm:

(map["minimumPerKm"] ?? 12)

.toDouble(),



maximumDistance:

(map["maximumDistance"] ?? 40)

.toDouble(),



acceptDelay:

map["acceptDelay"] ?? 2,



);



}








SettingsModel copyWith({



bool? autoAccept,


double? minimumFare,


double? minimumPerKm,


double? maximumDistance,


int? acceptDelay,



}){



return SettingsModel(



autoAccept:

autoAccept ?? this.autoAccept,



minimumFare:

minimumFare ?? this.minimumFare,



minimumPerKm:

minimumPerKm ?? this.minimumPerKm,



maximumDistance:

maximumDistance ?? this.maximumDistance,



acceptDelay:

acceptDelay ?? this.acceptDelay,



);



}



}
