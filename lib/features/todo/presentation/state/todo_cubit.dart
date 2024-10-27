
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/features/todo/domain/repository/todo_repo.dart';

/**
 * CUBIT - Simple state management
 * each cubit is a list of todos
 */

class TodoCubit extends Cubit<List<Todo>> {
  // reference to our repo
  final TodoRepo _todoRepo;
  // constructor initializes the state (cubit) with an empty list of todos
  TodoCubit(this._todoRepo) : super([]) {
    loadTods();
  } 

  // LOAD TODOS
  Future<void> loadTods() async {
    final todoList = await _todoRepo.getAllTodos();
    // emit the fetched todos to the state
    emit(todoList);
  }

  // ADD TODO
  Future<void> addTodo(String text) async {
    // create a new todo with unique id
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );
    // save the new todo to the repo
    await _todoRepo.addTodo(newTodo);
    // load todos again
    loadTods();
  }
  // DELETE TODO
  Future<void> delteTodo(Todo todo) async {
    // delete the provided todo from the repo
    await _todoRepo.deleteTodo(todo);
    // load todos again
    loadTods();
  }

  // TOGGLE TODO
  Future<void> toggleTodo(Todo todo) async {
    // update the todo in the repo
    final updatetodo =  todo.todoggleCompletion();

    // update the todo wit new completion status
    await _todoRepo.updateTodo(updatetodo);
    // load todos again
    loadTods();
  }

}