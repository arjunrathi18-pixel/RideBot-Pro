import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


import '../../models/ride_model.dart';





class RideDatabase {



static Database? _database;





static const String tableName = "rides";







static Future<void> initialize() async {



_database ??=

await _initDatabase();



}








static Future<Database> _initDatabase() async {



final path =

join(

await getDatabasesPath(),

"ridebot.db"

);





return await openDatabase(



path,



version: 1,



onCreate: (db, version) async {



await db.execute('''



CREATE TABLE $tableName (



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








static Database get database {



if(_database == null){


throw Exception(

"Database not initialized"

);


}



return _database!;



}









static Future<void> saveRide(

RideModel ride

) async {



await database.insert(



tableName,



ride.toMap(),



conflictAlgorithm:

ConflictAlgorithm.replace,



);



}









static Future<List<RideModel>> getAllRides() async {



final result =

await database.query(



tableName,



orderBy:

"id DESC",



);





return result

.map(

(e)=>RideModel.fromMap(e)

)

.toList();



}









static Future<List<RideModel>> getAcceptedRides() async {



final result =

await database.query(



tableName,



where:

"status = ?",



whereArgs:

["ACCEPTED"],



orderBy:

"id DESC",



);





return result

.map(

(e)=>RideModel.fromMap(e)

)

.toList();



}









static Future<double> getTotalEarning() async {



final result =

await database.rawQuery(



'''

SELECT SUM(fare) as total

FROM $tableName

WHERE status = ?

''',



["ACCEPTED"],



);





return

(result.first["total"] ?? 0)

as double;



}









static Future<int> getTotalRides() async {



final result =

await database.rawQuery(



'''

SELECT COUNT(*) as total

FROM $tableName

''',



);





return

(result.first["total"] ?? 0)

as int;



}









static Future<void> clearHistory() async {



await database.delete(

tableName

);



}



}
