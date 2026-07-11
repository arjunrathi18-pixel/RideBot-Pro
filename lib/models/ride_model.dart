import 'package:hive/hive.dart';



part 'ride_model.g.dart';





@HiveType(typeId: 1)

class RideModel extends HiveObject {



  @HiveField(0)
  final String platform;



  @HiveField(1)
  final double fare;



  @HiveField(2)
  final double distance;



  @HiveField(3)
  final double earningPerKm;



  @HiveField(4)
  final String pickup;



  @HiveField(5)
  final String dropLocation;



  @HiveField(6)
  final String status;



  @HiveField(7)
  final DateTime createdAt;





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








  RideModel copyWith({


    String? platform,


    double? fare,


    double? distance,


    double? earningPerKm,


    String? pickup,


    String? dropLocation,


    String? status,


    DateTime? createdAt,


  }) {



    return RideModel(



      platform:

          platform ?? this.platform,



      fare:

          fare ?? this.fare,



      distance:

          distance ?? this.distance,



      earningPerKm:

          earningPerKm ?? this.earningPerKm,



      pickup:

          pickup ?? this.pickup,



      dropLocation:

          dropLocation ?? this.dropLocation,



      status:

          status ?? this.status,



      createdAt:

          createdAt ?? this.createdAt,



    );



  }







  Map<String,dynamic> toMap(){



    return {



      "platform": platform,


      "fare": fare,


      "distance": distance,


      "earningPerKm": earningPerKm,


      "pickup": pickup,


      "dropLocation": dropLocation,


      "status": status,


      "createdAt": createdAt.toIso8601String(),



    };


  }







}
