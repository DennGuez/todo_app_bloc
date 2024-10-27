/*

  TO DO REPOSITORY

  Here you  define what the app can do

 */

import 'package:todo_app_bloc/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepo {
  // get all todos
  Future<List<Todo>> getAllTodos();
  // add a newtodo
  Future<void> addTodo(Todo todo);
  // update a todo
  Future<void> updateTodo(Todo todo);
  // delete a todo
  Future<void> deleteTodo(Todo todo);
}

/*

NOTES:
- The repository in the domain layer outlines  what operations the app can do, but
  doesn't implement them. That's the job of the data layer.

- Technology  agnostic: independent of any technology or framework.
 */