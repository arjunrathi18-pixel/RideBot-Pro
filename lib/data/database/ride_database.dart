import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


import '../../models/ride_model.dart';





class RideDatabase {



static Database? _database;





static Future<void> initialize() async {

_database ??= await _createDatabase();

}







static Future<Database> _createDatabase() async {



final dbPath = await getDatabasesPath();



final path = join(

dbPath,

"ridebot_pro.db"

);





return openDatabase(

path,

version: 1,

onCreate: (db, version) async {



await db.execute('''

CREATE TABLE rides(

id INTEGER PRIMARY KEY AUTOINCREMENT,

platform TEXT,

fare REAL,

distance REAL,

earningPerKm REAL,

pickup TEXT,

dropLocation TEXT,

status TEXT,

createdAt TEXT

)

''');



},



);



}








static Database get db {



if(_database == null){

throw Exception(

"Database not initialized"

);

}



return _database!;

}








static Future<int> saveRide(

RideModel ride

) async {



return await db.insert(

"rides",

ride.toMap(),

conflictAlgorithm:

ConflictAlgorithm.replace,

);



}








static Future<List<RideModel>> getAllRides() async {



final result = await db.query(

"rides",

orderBy:

"id DESC",

);





return result.map((e){

return RideModel.fromMap(e);

}).toList();



}








static Future<List<RideModel>> getAcceptedRides() async {



final result = await db.query(

"rides",

where:

"status = ?",



whereArgs:

["ACCEPTED"],



orderBy:

"id DESC",

);



return result.map((e){

return RideModel.fromMap(e);

}).toList();



}








static Future<int> getTotalRides() async {



final result = await db.rawQuery(

"SELECT COUNT(*) as count FROM rides"

);





return

(result.first["count"] as int?) ?? 0;



}








static Future<double> getTotalEarning() async {



final result = await db.rawQuery(

'''

SELECT SUM(fare) as total

FROM rides

WHERE status = ?

''',

["ACCEPTED"],

);






final value = result.first["total"];





if(value == null){

return 0.0;

}



return (value as num).toDouble();



}








static Future<void> clearHistory() async {



await db.delete(

"rides"

);



}



}
