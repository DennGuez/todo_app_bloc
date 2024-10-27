/*

  TO DO PAGE: responsible  for providing cubit to view (UI)

 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/features/todo/domain/repository/todo_repo.dart';
import 'package:todo_app_bloc/features/todo/presentation/pages/todo_view.dart';
import 'package:todo_app_bloc/features/todo/presentation/state/todo_cubit.dart';
class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;
  const TodoPage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoView()
    );
  }
}
