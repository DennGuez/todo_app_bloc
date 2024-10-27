/*

DATABASE REPOSITORY

This implements the todo repo (from Domain layer)

 */


import 'package:isar/isar.dart';
import 'package:todo_app_bloc/features/todo/data/models/isar_todo_model.dart';
import 'package:todo_app_bloc/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/features/todo/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo { 
  // Isar db
  final Isar db;

  IsarTodoRepo({required this.db});
  // get all todos
  @override
  Future<List<Todo>> getAllTodos() async {
    // fetch from db
    final todos = await db.isarTodoModels.where().findAll();
    // return as list of todos and give to domain layer
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }
  
  @override
  Future<void> addTodo(Todo todo) async {
    // convert todo into isar model
    final todoIsar = IsarTodoModel.fromDomain(todo);
    // save to db
    return db.writeTxn(() => db.isarTodoModels.put(todoIsar));
  }
  
  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(() =>db.isarTodoModels.delete(todo.id));
  }
  
  @override
  Future<void> updateTodo(Todo todo) async {
    // convert todo into isar model
    final todoIsar = IsarTodoModel.fromDomain(todo);
    // save to db
    await db.writeTxn(() => db.isarTodoModels.put(todoIsar));
  }
}