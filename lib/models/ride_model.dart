import 'package:hive/hive.dart';


part 'ride_model.g.dart';



@HiveType(typeId: 1)

class RideModel extends HiveObject {



@HiveField(0)
String platform;


@HiveField(1)
double fare;


@HiveField(2)
double distance;


@HiveField(3)
double earningPerKm;


@HiveField(4)
String pickup;


@HiveField(5)
String dropLocation;


@HiveField(6)
String status;


@HiveField(7)
DateTime createdAt;



RideModel({

required this.platform,

required this.fare,

required this.distance,

required this.earningPerKm,

required this.pickup,

required this.dropLocation,

required this.status,

required this.createdAt,


});



}
