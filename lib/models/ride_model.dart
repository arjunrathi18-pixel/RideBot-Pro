class RideModel {


  final int? id;


  final String platform;


  final double fare;


  final double distance;


  final double earningPerKm;


  final String pickup;


  final String dropLocation;


  final String status;


  final DateTime createdAt;





  RideModel({


    this.id,


    required this.platform,


    required this.fare,


    required this.distance,


    required this.earningPerKm,


    required this.pickup,


    required this.dropLocation,


    required this.status,


    required this.createdAt,


  });







  Map<String, dynamic> toMap(){



    return {



      'id': id,


      'platform': platform,


      'fare': fare,


      'distance': distance,


      'earningPerKm': earningPerKm,


      'pickup': pickup,


      'dropLocation': dropLocation,


      'status': status,


      'createdAt': createdAt.toIso8601String(),



    };



  }









  factory RideModel.fromMap(

      Map<String, dynamic> map

  ){



    return RideModel(



      id: map['id'],



      platform:

          map['platform'] ?? '',



      fare:

          (map['fare'] ?? 0).toDouble(),



      distance:

          (map['distance'] ?? 0).toDouble(),



      earningPerKm:

          (map['earningPerKm'] ?? 0).toDouble(),



      pickup:

          map['pickup'] ?? '',



      dropLocation:

          map['dropLocation'] ?? '',



      status:

          map['status'] ?? '',



      createdAt:

          DateTime.parse(

            map['createdAt'],

          ),



    );



  }









  RideModel copyWith({



    int? id,


    String? platform,


    double? fare,


    double? distance,


    double? earningPerKm,


    String? pickup,


    String? dropLocation,


    String? status,


    DateTime? createdAt,



  }){



    return RideModel(



      id:

          id ?? this.id,



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



}
