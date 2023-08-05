import 'package:floor/floor.dart';
import 'package:todo_list/features/todo/domain/entities/todo.dart';

@Entity(tableName: 'Todos', primaryKeys: ['id'])
class TodoModel extends TodoEntity {
  const TodoModel({
    @PrimaryKey(autoGenerate: true) int? id,
    String? title,
    String? description,
    @ColumnInfo(name: 'is_completed') bool? isCompleted,
  }) : super(
          id: id,
          title: title,
          description: description,
          isCompleted: isCompleted ?? false,
        );

  factory TodoModel.fromEntity(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      isCompleted: entity.isCompleted,
    );
  }
}

// A helper class to make completing todos easier in repository implementation.
class CompletedTodoModel extends TodoModel {
  @override
  const CompletedTodoModel({
    int? id,
    String? title,
    String? description,
  }) : super(id: id, title: title, description: description, isCompleted: true);

  @override
  factory CompletedTodoModel.fromEntity(TodoEntity entity) {
    return CompletedTodoModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
    );
  }
}
