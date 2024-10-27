/*

  TO DO VIEW: responsible for rendering the UI

 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app_bloc/features/todo/presentation/state/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});
  // show dialog box to add todo
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(controller: textController,),
        actions: [
          // cancel button
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          // add button
          TextButton(
            onPressed: () {
              todoCubit.addTodo( textController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          )
        ],
      )
    );
  }
  // BUILD UI
  @override
  Widget build(BuildContext context) {
    // todo cubit
    final todoCubit = context.watch<TodoCubit>();
    // SCAFFOLD
    return Scaffold(
      // FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoBox(context),
        child: const Icon(Icons.add),
      ),
      // BLOC BUILDER
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          // List view
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              // get individual todo from todo list
              final todo = todos[index];
              // List tile UI
              return ListTile(
                // text
                title: Text(todo.text),
                // check box 
                leading: Checkbox(
                  value: todo.isCompleted, 
                  onChanged: (value) => todoCubit.toggleTodo(todo),
                ),
                // delete button
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => todoCubit.delteTodo(todo),
                )
              );
            }
          );
        }
      )
    );
  }
}