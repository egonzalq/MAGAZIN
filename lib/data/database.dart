import 'package:flutter/material.dart';
import 'package:flutter_application_uno/controllers/task_controller.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class TaskLocalDataSource {
  Database? _database;
  

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatebase();
    return _database!;
  }

  _initDatebase() async {
    String path = join(await getDatabasesPath(), 'task_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, data TEXT, state INTEGER)');
  }

  Future<void> addTasks(TaskModel task) async {
    final db = await database;

    await db.insert(
      'task',
      task.toMapSqlite(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TaskModel>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) {
      return TaskModel(
        id: maps[i]['id'],
        content: maps[i]['content'],
        data: DateTime.parse(maps[i]['date']),
        state: maps[i]['state'] == 0 ? false : true,
      );
    });
  }

  Future<void> deleteTasks(id) async {
    Database db = await database;
    await db.delete('tanks', where: 'id=?', whereArgs: [id]);
  }

  Future<void> deleteAll(id) async {
    Database db = await database;
    await db.delete('tanks');
  }

  Future<void> updateTask(TaskModel task) async {
    Database db = await database;
    await db.update(
        'tanks',
        {
          'content': task.content,
          'date': DateFormat('yyyy-mm-dd').format(task.date),
          'state': task.state ? 1 : 0,
        },
        where: 'id=?',
        whereArgs: [task.id]);
  }
}
