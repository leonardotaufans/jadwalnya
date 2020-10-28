import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:jadwalnya/models/schedule.dart';
import 'package:jadwalnya/constants.dart';

class SqliteHelper {

  Future<Database> initDb() async {
    final Future<Database> database =
    openDatabase(join(await getDatabasesPath(), 'schedule_database.db'),
        onCreate: (db, version) {
          return db.execute(""
              "CREATE TABLE $tbName "
              "("
              "$uid $intType $primaryKey, $imageUri $stringType, "
              "$title $stringType, "
              "$timeBegin $stringType, $timeEnd $stringType, "
              "$classRoom $stringType, $assignment $intType"
              ")");
        }, version: 1);
    return database;
  }

  Future<void> insertSchedule(Schedule schedule) async {
    final Database db = await initDb();
    await db.insert(tbName, schedule.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Schedule>> schedules() async {
    final Database db = await initDb();
    final List<Map<String, dynamic>> maps = await db.query(tbName);
    return List.generate(maps.length, (index) {
      return Schedule(
          maps[index][uid].toString(),
          maps[index][imageUri],
          maps[index][title],
          maps[index][timeBegin],
          maps[index][timeEnd],
          maps[index][classRoom],
          maps[index][assignment]);
    });
  }

  Future<void> updateSchedule(Schedule schedule) async {
    final Database db = await initDb();
    await db.update(tbName,
        schedule.toMap(),
        where: "$uid = ?",
        whereArgs: [schedule.uidSched]
    );
  }

  Future<void> deleteSchedule(int idSched) async {
    final Database db = await initDb();
    await db.delete(tbName,
        where: "$uid = ?",
        whereArgs: [idSched]);
  }
}
