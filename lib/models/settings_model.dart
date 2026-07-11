import 'package:hive/hive.dart';


part 'settings_model.g.dart';




@HiveType(typeId: 2)

class SettingsModel extends HiveObject {



@HiveField(0)
bool autoAccept;



@HiveField(1)
double minimumFare;



@HiveField(2)
double minimumPerKm;



@HiveField(3)
double maximumDistance;



@HiveField(4)
int acceptDelay;




SettingsModel({

this.autoAccept = false,

this.minimumFare = 100,

this.minimumPerKm = 12,

this.maximumDistance = 40,

this.acceptDelay = 2,

});







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
