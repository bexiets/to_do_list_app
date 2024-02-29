import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_list_app/cubit/todo_cubit.dart';

import 'package:to_do_list_app/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TodoCubit(),
        child: MaterialApp(
          home: TasksScreen(),
        ),
      );
    
  }
}
