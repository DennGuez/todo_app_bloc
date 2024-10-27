import 'package:isar/isar.dart';
import 'package:todo_app_bloc/features/todo/domain/entities/todo_entity.dart';
part 'isar_todo_model.g.dart';

@collection
class IsarTodoModel {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  // convert isar object -> pure todo object to use in our app
  Todo toDomain(){
    return Todo(
      id: id,
      text: text,
      isCompleted: isCompleted
    );
  }

  // convert pure todo object -> isar object to save in our local isar db
  static IsarTodoModel fromDomain(Todo todo){
    return IsarTodoModel()
    ..id = todo.id
    ..text = todo.text
    ..isCompleted = todo.isCompleted;
  }
}