import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final bool? isCompleted;

  const TodoEntity({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      isCompleted,
    ];
  }
}
