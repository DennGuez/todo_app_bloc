import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app_bloc/features/todo/data/models/isar_todo_model.dart';
import 'package:todo_app_bloc/features/todo/data/repositories/isar_todo_repo.dart';
import 'package:todo_app_bloc/features/todo/domain/repository/todo_repo.dart';
import 'package:todo_app_bloc/features/todo/presentation/pages/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // get directory path for storing data
  final directory = await getApplicationCacheDirectory();
  // open isar database
  final isar = await Isar.open([IsarTodoModelSchema], directory: directory.path);
  print(isar);
  print(directory.path);
  // initialize our todo repo with isar database
  final isarTodoRepo = IsarTodoRepo(db: isar);
  print(isarTodoRepo);
  // run app
  runApp(MyApp(
    todoRepo: isarTodoRepo,
  ));
}

class MyApp extends StatelessWidget {
  // database injection through the app
  final TodoRepo todoRepo;

  const MyApp({super.key, required this.todoRepo});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo)
    );
  }
}
