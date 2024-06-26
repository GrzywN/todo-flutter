// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TodoDao? _todoDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Todos` (`id` INTEGER, `title` TEXT, `description` TEXT, `isCompleted` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TodoDao get todoDAO {
    return _todoDAOInstance ??= _$TodoDao(database, changeListener);
  }
}

class _$TodoDao extends TodoDao {
  _$TodoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _todoModelInsertionAdapter = InsertionAdapter(
            database,
            'Todos',
            (TodoModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'isCompleted': item.isCompleted == null
                      ? null
                      : (item.isCompleted! ? 1 : 0)
                }),
        _todoModelUpdateAdapter = UpdateAdapter(
            database,
            'Todos',
            ['id'],
            (TodoModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'isCompleted': item.isCompleted == null
                      ? null
                      : (item.isCompleted! ? 1 : 0)
                }),
        _todoModelDeletionAdapter = DeletionAdapter(
            database,
            'Todos',
            ['id'],
            (TodoModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'isCompleted': item.isCompleted == null
                      ? null
                      : (item.isCompleted! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TodoModel> _todoModelInsertionAdapter;

  final UpdateAdapter<TodoModel> _todoModelUpdateAdapter;

  final DeletionAdapter<TodoModel> _todoModelDeletionAdapter;

  @override
  Future<List<TodoModel>> getAllTodos() async {
    return _queryAdapter.queryList('SELECT * FROM Todos ORDER BY id DESC',
        mapper: (Map<String, Object?> row) => TodoModel(
            id: row['id'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            isCompleted: row['isCompleted'] == null
                ? null
                : (row['isCompleted'] as int) != 0));
  }

  @override
  Future<void> insertTodo(TodoModel todo) async {
    await _todoModelInsertionAdapter.insert(todo, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    await _todoModelUpdateAdapter.update(todo, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTodo(TodoModel todo) async {
    await _todoModelDeletionAdapter.delete(todo);
  }
}
