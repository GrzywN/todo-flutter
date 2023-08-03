import 'package:floor/floor.dart';
import 'package:todo_list/features/todo/data/data_sources/local/DAO/todo_dao.dart';
import 'package:todo_list/features/todo/data/models/todo.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [TodoModel])
abstract class AppDatabase extends FloorDatabase {
  TodoDao get todoDAO;
}

final initDatabase = $FloorAppDatabase.databaseBuilder('app_database.db').build;
