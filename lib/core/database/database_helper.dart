import 'dart:async';

import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

// Define a class to represent the database helper
class DatabaseHelper {
  static const _databaseName = "flutter_template.db";
  static const _databaseVersion = 1;

  // The table and column names
  static const table = 'example_table';
  static const columnId = 'id';
  static const columnName = 'name';

  // Singleton pattern
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  // Private constructor
  DatabaseHelper._init();

  // Open the database
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  // Create the table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL
    )
    ''');
  }

  // Insert data into the database
  Future<int> insert(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert(table, row);
  }

  // Query all rows
  Future<List<Map<String, dynamic>>> queryAll() async {
    final db = await database;
    return await db.query(table);
  }

  // Update a row in the database
  Future<int> update(Map<String, dynamic> row) async {
    final db = await database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Delete a row from the database
  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
