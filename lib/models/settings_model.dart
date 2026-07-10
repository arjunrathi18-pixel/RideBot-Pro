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

this.autoAccept=false,

this.minimumFare=100,

this.minimumPerKm=12,

this.maximumDistance=40,

this.acceptDelay=2,


});



}
